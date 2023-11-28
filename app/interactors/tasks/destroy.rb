module Tasks
    class Destroy
      include Interactor
  
      delegate :task, to: :context
  
      def call
        context.task = task
  
        context.fail!(error: "Task destruction failed") unless task.destroy
      end
    end
  end