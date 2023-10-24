class CreateProject
  include Interactor

  delegate :project_params, :user, to: :context

  def call
    project = Project.new(project_params)
    context.project = project
    context.fail! unless project.save
    raise_error unless create_owner
  end

  private

  def raise_error
    project.destroy && context.fail!
  end

  def create_owner
    project_membership = ProjectMembership.new(prepared_owner_membership_params)
    project_membership.save
  end

  def prepared_owner_membership_params
    {
      project: context.project,
      user: user,
      role: :owner
    }
  end
end
