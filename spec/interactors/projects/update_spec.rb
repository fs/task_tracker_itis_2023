require "rails_helper"

describe Projects::Update do
  let(:interactor) { described_class.new(project: project, project_params: params) }
  let(:project) { create :project }
  let(:params) do
    {
      name: "new test name",
      description: "new test description"
    }
  end

  describe ".call" do
    context "when params are valid" do
      it "changes project" do
        expect { interactor.run }.to change(project, :name).to("new test name") and change(project, :description).to("new test description")
      end

      it "doesn't throw error" do
        interactor.run

        expect(interactor.context.error).to eq(nil)
      end
    end

    context "when params are invalid" do
      let(:project) { create :project, name: "test name", description: "test description" }
      let(:params) do
        {
          name: nil
        }
      end

      let(:expected_error_message) { "Invalid data" }

      it "throws error" do
        interactor.run

        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end

  describe "#after" do
    let(:users) { project.users }

    before do
      allow(interactor).to receive(:call)

      users.each do
        allow(ProjectMailer).to receive(:project_updated).and_call_original
      end
    end

    it "sends mail" do
      interactor.run

      users.each do
        expect(ProjectMailer).to receive(:project_updated).and_return(double(deliver_later: true)).with(project, user)
      end
    end
  end
end
