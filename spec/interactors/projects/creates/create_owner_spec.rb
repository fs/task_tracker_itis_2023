require "rails_helper"
require "factory_bot"

describe Projects::Creates::CreateOwner do
  describe ".call" do
    let(:interactor) { described_class.new(project: project, user: user) }

    context "when params are valid" do
      let(:project) { create :project }
      let(:user) { create :user }

      it { expect { interactor.run }.to change(ProjectMembership, :count).by(1) }
    end

    context "when params are invalid" do
      let(:project) { create :project }
      let(:user) { nil }

      let(:expected_error_message) { "Invalid data" }

      it "fails" do
        interactor.run

        expect(Project.where(id: project.id)).not_to be_exists
        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
