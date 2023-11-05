module Tasks
  class Destroy
    include Interactor

    delegate :task, to: :context

    before do
      context.task = task
      context.project = task.project
      context.users = User.where(id: task.project.users.pluck(:id))
    end

    def call
      task.destroy
    end

    after do
      context.users.each do |user|
        TaskMailer.task_deleted(user).deliver_later
      end
    end
  end
end
