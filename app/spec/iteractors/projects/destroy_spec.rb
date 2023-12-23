# frozen_string_literal: true

require "rails_helper"

describe Projects::Destroy do
  let!(:user1) { create :user, first_name: "test", last_name: "test", email: "admin@admin.ru", role: "admin" }
  let!(:project) { create :project, users: users }
  let!(:users) { [user1] }
  let(:interactor) { described_class.new(project: project, users: users) }

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
      allow(ProjectMailer).to receive(:project_destroyed).and_call_original
    end

    it "sends mail" do
      interactor.run

      users.each do |user|
        expect(ProjectMailer).to have_received(:project_destroyed).with(user)
      end
    end
  end
end