module Projects
  class Destroy
    include Interactor

    delegate :project, to: :context

    def call
      context.fail!(error: "project didn't delete") unless project.destroy()
      context.notice = "project successfully deleted"
    end

  end
end
