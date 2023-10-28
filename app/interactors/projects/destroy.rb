module Projects

  class Destroy
    include Interactor

    delegate :project, to: :context
    def call
      context.fail!(error: "Something went wrong, project cannot be deleted!") unless project.destroy
      context.notice = "Project has been deleted!"
    end

  end
end