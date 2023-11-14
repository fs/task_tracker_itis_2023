module Projects
  class Update
    include Interactor

    delegate :project_params, to: :context

    def call
      if project.update(project_params)
        context.success = true
      else
        context.fail!(error: "failed")
      end
    end
  end
end
