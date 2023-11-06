module Tasks
  class Destroy
    include Interactor

    delegate :task, :project, :user, to: :context

    before do
      @task_name = task.name
      @task_description = task.description
    end

    def call
      task.destroy
    end

    after do
      TaskMailer.task_destroyed(@task_name, @task_description, project, user).deliver_later
    end
  end
end
