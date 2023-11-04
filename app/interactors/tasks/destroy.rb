module Tasks
  class Destroy
    include Interactor

    delegate :task, :project, to: :context

    before do
      @task_name = task.name
      @task_description = task.description
    end
    def call
      task.destroy
    end

    after do
      TaskMailer.task_deleted(@task_name, @task_description, project).deliver_later
    end
  end
end
