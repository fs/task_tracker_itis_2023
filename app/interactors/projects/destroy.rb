module Projects
  class Destroy
    include Interactor

    delegate :project, to: :context

    before do
      context.users = project.users
    end

    def call
      project.destroy
    end

    after do
      context.users.each do |user|
        ProjectMailer.project_destroyed(user).deliver_later
      end
    end
  end
end
