require "rails_helper"

describe Projects::Destroy do
  describe ".call" do
    let(:interactor) { described_class.new(project: project, users: users) }
    let!(:project) { create(:project) }
    let!(:users) { create_list(:user, 3, projects: [project]) }

    it "destroys the project" do
      expect { interactor.run }.to change(Project, :count).by(-1)
    end

    it "sends project destruction emails to all users" do
      allow(ProjectMailer).to receive(:project_destroyed).and_call_original
      interactor.run

      users.each do |user|
        expect(ProjectMailer).to have_received(:project_destroyed).with(user).once
      end
    end
  end
end
