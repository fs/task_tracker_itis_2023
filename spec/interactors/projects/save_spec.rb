require "rails_helper"

describe Projects::Save do
  describe ".call" do
    let(:interactor) { described_class.new(project_params: params) }

    context "when params are valid" do
      let(:params) do
        {
          name: "test name",
          description: "test description"
        }
      end

      it { expect { interactor.run }.to change(Project, :count).by(1) }
    end

    context "when params are invalid" do
      let(:params) do
        {
          description: "test description"
        }
      end

      let(:expected_error_message) { "Invalid data" }

      it "throws error" do
        interactor.run

        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
