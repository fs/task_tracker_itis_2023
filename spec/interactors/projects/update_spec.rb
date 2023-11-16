require "rails_helper"

describe Projects::Update do
  let(:project) { create(:project) }
  let(:user) { create(:user, email: "test@example.com") }
  let(:project_params) { { name: "Updated Project Name" } }
  let(:context) { { project: project, project_params: project_params } }

  subject(:interactor) { described_class.call(context) }

  describe ".call" do
    context "when the project update is successful" do
      it "updates the project" do
        expect { interactor }.to change { project.reload.name }.to("Updated Project Name")
      end

      it "sends project update emails to users" do
        expect { interactor }.to change { ActionMailer::Base.deliveries.count }.by(project.users.count)
      end

      it "does not fail" do
        expect(interactor.success?).to be true
      end
    end

    context "when the project update fails" do
      before do
        allow(project).to receive(:update).and_return(false)
      end

      it "does not update the project" do
        expect { interactor }.not_to change { project.reload.name }
      end

      it "does not send project update emails" do
        expect { interactor }.not_to change { ActionMailer::Base.deliveries.count }
      end

      it "fails with an error message" do
        expect(interactor.failure?).to be true
        expect(interactor.error).to eq("Invalid data")
      end
    end
  end

  describe "#after" do
    it "sends project update emails to each user" do
      allow(project).to receive(:update).and_return(true)

      project.users.each do |user|
        expect(ProjectMailer).to receive(:project_updated).with(project, user).and_return(double(deliver_later: true))
      end

      described_class.call(context)
    end
  end
end
