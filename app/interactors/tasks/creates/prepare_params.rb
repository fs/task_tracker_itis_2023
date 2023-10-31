module Tasks
  module Creates
    class PrepareParams
      include Interactor

      delegate :task_params, :project, to: :context

      def call
        task_params.merge!(project: project)
      end
    end
  end
end
