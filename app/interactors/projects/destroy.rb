module Projects
  class Destroy
    include Interactor

    delegate :project, to: :context

    def call
      context.fail!(error: "Can't destroy") unless project.destroy
    end
  end
end
