class TaskMailer < ApplicationMailer
  def task_created_to_members(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :member }).pluck(:email))
  end

  def task_created_to_owner(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :owner }).pluck(:email))
  end

  def task_updated(project, task)
    @project = project
    @task = task
    @project_memberships = ProjectMembership.find_by(project_id: project.id)

    @project_memberships.each do |member|
      mail(to: member.email)
    end
  end

  def task_destroyed_to_initiator_owner(project, task, user)
    @project = project
    @task = task
    mail(to: user.email)
  end

  def task_destroyed_to_owner(project, task)
    @project = project
    @task = task
    @owner = ProjectMembership.find_by(project: project, role: ROLES.owner)
    mail(to: @owner.email)
  end

  def task_destroyed_to_initiator_member(project, task, user)
    @project = project
    @task = task
    mail(to: user.email)
  end

  def task_destroyed_to_members(project, task, user)
    @project = project
    @task = task
    @project_memberships = ProjectMembership.find_by(project_id: project.id)

    @project_memberships.each do |member|
      mail(to: member.email) unless member.id != user.id && !member.owner?
    end
  end
end
