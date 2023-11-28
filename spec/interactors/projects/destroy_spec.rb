require "rails_helper"

describe Projects::Destroy do
  let!(:user1) { create :user, first_name: "test", last_name: "test", email: "admin@admin.ru", role: "admin" }
  let!(:user2) { create :user, first_name: "test", last_name: "test", email: "test@test.ru", role: "member" }
  let!(:project) { create :project, users: [user1, user2] }
  let!(:users) { [user1, user2] }
  let(:interactor) { described_class.new(project: project) }


  describe "#before" do
    it "finds users correctly" do
      interactor.run

      expect(interactor.context.users).to eq(users)
    end
  end

  describe ".call" do
    it "destroys project" do
      expect { interactor.run }.to change(Project, :count).by(-1)
    end
  end

  describe "#after" do
    before do
      allow(interactor).to receive(:call)

      users.each do
        allow(ProjectMailer).to receive(:project_destroyed).and_call_original
      end
    end

    it "sends mail" do
      interactor.run

      users.each do |user|
        expect(ProjectMailer).to receive(:project_destroyed).with(_user).and_return(double(deliver_later: true))
      end
    end
  end
end
