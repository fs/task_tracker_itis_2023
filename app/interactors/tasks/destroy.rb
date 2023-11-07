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
      users = User.where(id: task.project.users.pluck(:id))
      users.each do |user|
        TaskMailer.task_deleted(@task_name, @task_description, user).deliver_later
      end
    end
  end
end
