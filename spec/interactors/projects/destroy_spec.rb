require 'rails_helper'

describe Projects::Destroy do
  let!(:user1) { create :user }
  let!(:user2) { create :user }
  let!(:project) { create :project, users: [user1, user2] }
  let(:context) { { project: project, users: nil } }

  describe "#before" do
    context "when project and users are set up" do
      it "verifies project and user setup" do
        expect(Project.count).to eq(1)
        expect(User.count).to eq(2)
      end
    end
  end

  describe ".call" do
    context "when project is successfully destroyed" do
      let!(:user1) { create :user }
      let!(:user2) { create :user }
      let!(:project) { create :project, users: [user1, user2] }
      let(:interactor) { described_class.new(project: project, users: nil) }

      it "destroys the project and sends emails to users" do
        expect(ProjectMailer).to receive(:project_destroyed).with(user1).and_return(double(deliver_later: true))
        expect(ProjectMailer).to receive(:project_destroyed).with(user2).and_return(double(deliver_later: true))

        expect { interactor.run }.to change { Project.count }.by(-1)
      end
    end
  end

  describe 'after' do
    it 'sends emails to users' do
      expect(ProjectMailer).to receive(:project_destroyed).with(user1).and_return(double(deliver_later: true))
      expect(ProjectMailer).to receive(:project_destroyed).with(user2).and_return(double(deliver_later: true))

      described_class.call(context)
    end
  end
end
