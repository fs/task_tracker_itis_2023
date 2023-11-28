require "rails_helper"

describe Projects::Update do # rubocop:disable Metrics/BlockLength
  describe ".call" do
    let(:interactor) { described_class.new(context) }
    let!(:project) { create(:project) }
    let!(:users) { create_list(:user, 3, projects: [project]) }

    context "when project update is successful" do
      let(:context) { { project: project, project_params: { name: "New Name" } } }

      it "updates the project" do
        interactor.run
        expect(project.reload.name).to eq("New Name")
      end

      it "sends project update emails to all users" do
        allow(ProjectMailer).to receive(:project_updated).and_call_original
        interactor.run

        users.each do |user|
          expect(ProjectMailer).to have_received(:project_updated).with(project, user).once
        end
      end
    end

    context "when project update fails" do
      let(:context) { { project: project, project_params: { name: "" } } }

      it "fails the context with an error message" do
        interactor.run
        expect(interactor.context.failure?).to be true
        expect(interactor.context.error).to eq("Invalid data")
      end
    end
  end
end
