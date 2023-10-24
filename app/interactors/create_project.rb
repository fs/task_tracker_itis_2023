class CreateProject
  include Interactor

  def call
    project = Project.new(project_params)
    project_membership = ProjectMembership.new(project_membership_params)

    project.save
    project_membership.save
  end
end
