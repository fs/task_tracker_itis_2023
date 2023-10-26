module Projects
  class Destroy
    include Interactor

    delegate :project, to: :context

    def call
      if project.destroy
        context.success = true
      else
        context.fail!(error: "Project destruction failed")
      end
    end
  end
end
