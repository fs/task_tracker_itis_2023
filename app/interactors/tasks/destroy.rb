module Tasks
    class Destroy
      include Interactor
  
      delegate :task, to: :context
  
      def call
        context.fail!(error: "Can't destroy") unless task.destroy
      end
    end
  end