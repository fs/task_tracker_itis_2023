class CreateProject
  include Interactor

  delegate :project_params, :user, to: :context

  def call
    project = Project.new(project_params)
    project_membership = ProjectMembership.new(
      project: project,
      user: user,
      role: :owner
    )
    context.project = project
    context.fail! unless project.save
    project.destroy && context.fail! unless project_membership.save
  end
end
