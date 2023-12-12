module Projects
  class Destroy
    include Interactor

    delegate :project, to: :context

    def call
      destroy_project_or_fail
    end

    private

    def destroy_project_or_fail
      unless project.destroy
        context.fail!(error: "Failed to destroy project")
      end
    end
  end
end
