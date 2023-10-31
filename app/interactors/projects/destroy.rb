module Projects
  class Destroy
    include Interactor

    delegate :project, to: :context

    def call
      project.destroy
    end
  end
end
