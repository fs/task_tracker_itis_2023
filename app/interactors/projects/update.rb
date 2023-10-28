module Projects

  class Update
    include Interactor

    delegate :project, :project_params, to: :context

    def call
      context.fail!(error: "Failed to update the project") unless project.update(project_params)
      context.notice = "Project has been updated!"
    end

  end
end