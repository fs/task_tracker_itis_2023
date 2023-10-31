module Projects
  class Update
    include Interactor

    delegate :project, :project_params, to: :context

    def call
      context.fail!(error: "Invalid data") unless project.update(project_params)
    end
  end
end
