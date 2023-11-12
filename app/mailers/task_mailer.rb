class TaskMailer < ApplicationMailer
  def task_created(task, project)
    @task = task
    @project = project
    @project_memberships = ProjectMembership.where(project_id: project.id)

    @project_memberships.each do |membership|
      if membership.role == 'owner'
        mail(to: membership.user.email, subject: "New Task Created in Your Project!")
      elsif membership.role == 'member'
        mail(to: membership.user.email, subject: "New Task Created in Project!")
      end
    end
  end

  def task_updated(task, project)
    @task = task
    @project = project
    @project_memberships = ProjectMembership.where(project_id: project.id)

    @project_memberships.each do |membership|
      mail(to: membership.user.email, subject: "A task has been updated!")
    end
  end

  def task_destroyed_to_initiator_owner(project, task_params, user)
    @project = project
    @task_name = task_params["name"]

    mail(to: user.email)
  end

  def task_destroyed_to_owner(project, task_params)
    @project = project
    @task_name = task_params["name"]
    owner = ProjectMembership.find_by(project: project, role: :owner)

    mail(to: owner.user.email)
  end

  def task_destroyed_to_initiator_member(project, task_params, user)
    @task_name = task_params["name"]
    @project = project

    mail(to: user.email)
  end

  def task_destroyed_to_members(project, task_params, user)
    @task_name = task_params["name"]
    project_memberships = ProjectMembership.includes(:user).where(project_id: project.id)

    project_memberships.each do |member|
      mail(to: member.user.email) unless member.user.id != user.id && !member.owner?
    end
  end

end
