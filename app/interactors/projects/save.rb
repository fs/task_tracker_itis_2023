module Projects
  class Save
    include Interactor

    delegate :project_params, to: :context

    def call
      context.project = project

      context.fail!(error: "Invalid data") unless project.save
    end

    private

    def project
      @project ||= Project.new(project_params)
    end
  end
end
