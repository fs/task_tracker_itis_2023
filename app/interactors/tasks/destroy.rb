module Tasks
  class Destroy
    include Interactor

    delegate :project, :task, to: :context

    def call
      @task_name = task.name
      task.destroy
    end

    after do
      TaskMailer.task_destroy(project, @task_name).deliver_later
    end

  end
end
