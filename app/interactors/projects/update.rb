module Projects
  class Update
    include Interactor

    delegate :project_params, :project, to: :context

    def call
      update_project_or_fail
    end

    private

    def update_project_or_fail
      unless project.update(project_params)
        context.fail!(error: "Failed to update project")
      end
    end
  end
end
