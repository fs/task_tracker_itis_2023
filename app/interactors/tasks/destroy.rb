module Tasks
  class Destroy
    include Interactor

    delegate :task, :user, to: :context
    delegate :project, to: :task

    def call
      task.destroy
    end

    after do
      TaskMailer.task_destroyed(project, task, user).deliver_later
    end
  end
end
