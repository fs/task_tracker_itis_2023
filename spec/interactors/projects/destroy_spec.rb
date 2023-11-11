require "rails_helper"

describe Projects::Destroy do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, users: [user]) }
  let(:interactor) { described_class.new(project: project, user: user) }

  describe "#before" do
    it "returns valid users" do

      expect(User.where(id: project.users.pluck(:id))).to exist
    end
  end

  describe "#call" do
    it "destroys the project" do

      puts "Project Memberships count before destruction: #{project.project_memberships.count}"

      expect { interactor.run }.to change(Project, :count).by(-1)
      expect(Project.find_by(id: project.id)).to be_nil

      puts "Project Memberships count after destruction: #{project.project_memberships.count}"
    end
  end

  describe "#after" do
    it "sends project_destroyed email to each user" do
      allow(ProjectMailer).to receive(:project_destroyed).and_return(double(deliver_later: true))

      interactor.run

      expect(ProjectMailer).to have_received(:project_destroyed).with(user).once
    end
  end
end
