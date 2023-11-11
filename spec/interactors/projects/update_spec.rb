require "rails_helper"

describe Projects::Update do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, users: [user]) }
  let(:interactor) { described_class.new(project: project, project_params: params) }

  describe ".call" do

    context "when params are valid" do
      let(:params) do
        {
          name: "test name",
          description: "test description"
        }
      end
      it "updates the project" do
        expect { interactor.run }.to change { project.reload.name }.to(params[:name]).and change { project.reload.description }.to(params[:description])
      end

      it "sends the email" do
        expect(ProjectMailer).to receive(:project_created).and_return(double(deliver_later: true)).with(project, user)
      end

      context "when params are invalid" do
        let(:params) do
          {
            description: "test description"
          }
        end

        let(:expected_error_message) { "Invalid data" }

        it "throws error" do
          interactor.run

          expect(interactor.context.error).to eq(expected_error_message)
        end
      end

    end
  end
end