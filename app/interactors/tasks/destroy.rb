module Tasks
  class Destroy
    include Interactor

    delegate :task, :project, :current_user, to: :context

    def call
      task.destroy
    end

    after do
      TaskMailer.task_destroyed(project, task, current_user)
    end
  end
end
