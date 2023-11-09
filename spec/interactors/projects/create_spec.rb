require "rails_helper"

describe Projects::Create do # rubocop:disable Metrics/BlockLength
  let(:interactor) { described_class.new(project: project, user: user) }

  describe ".organized" do
    let(:expected_interactors) do
      [
        Projects::Save,
        Projects::Creates::CreateOwner
      ]
    end

    it "organizes interactors correctly" do
      expect(described_class.organized).to eq(expected_interactors)
    end
  end

  describe "#after" do
    let(:project) { create :project }
    let(:user) { create :user, first_name: "test", last_name: "test", email: "admin@admin.ru", role: "member" }

    before do
      allow(interactor).to receive(:call)

      allow(Projects::CreateDefaultTasksJob).to receive(:perform_async)
      allow(ProjectMailer).to receive(:project_created).and_call_original
    end

    it "sends mail" do
      expect(ProjectMailer).to receive(:project_created).and_return(double(deliver_later: true)).with(project, user)

      interactor.run

      expect(Projects::CreateDefaultTasksJob).to have_received(:perform_async).with(project.id)
    end
  end
end
