module Projects
  class Update
    include Interactor

    delegate :project, :project_params, to: :context

    def call
      context.fail!(error: "Invalid data") unless project.update(project_params)
    end

    after do
      project.users.each do |user|
        ProjectMailer.project_updated(project, user).deliver_later
      end
    end
  end
end
