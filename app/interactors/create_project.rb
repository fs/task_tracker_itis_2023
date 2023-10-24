class CreateProject
  include Interactor

  delegate :project_params, :project_membership_params, to: :context

  def call
    project = Project.new(project_params)
    project_membership = ProjectMembership.new(project_membership_params)
    context.project = project

    project.save
    project_membership.save
  end
end
