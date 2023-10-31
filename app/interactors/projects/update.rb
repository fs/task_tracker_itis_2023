module Projects
  class Update
    include Interactor
        
    delegate :project, :project_params, to: :context

    def call
      context.fail!(error: "Fail..") unless project.update(project_params)
      context.notice = "Project successfully updated"
    end
  end
end
