module Projects
  class Update
    include Interactor

    delegate :project, :project_params, to: :context

    def call
      if project.update(project_params)
        context.status = :success
      else
        context.fail!(error: "Invalid data")
      end
    end
  end
end
