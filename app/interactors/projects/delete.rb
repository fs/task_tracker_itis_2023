module Projects
  class Delete
    include Interactor

    delegate :project, to: :context

    def call
      if project.destroy
        context.status = :success
      else
        context.fail!(error: "Failed to delete project")
      end
    end
  end
end
