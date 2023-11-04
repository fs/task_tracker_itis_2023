module Projects
  class Destroy
    include Interactor

    delegate :project, :users, to: :context

    before do
      context.users = User.where(id: project.users.pluck(:id))
    end

    def call
      project.destroy
    end

    after do
      users.each do |user|
        ProjectMailer.project_destroyed(user).deliver_later
      end
    end
  end
end
