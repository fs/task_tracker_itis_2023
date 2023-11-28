module Projects
    class Destroy
      include Interactor
  
      delegate :project, to: :context
  
      def call
        context.project = project
  
        context.fail!(error: "Project destruction failed") unless project.destroy
      end
    end
  end