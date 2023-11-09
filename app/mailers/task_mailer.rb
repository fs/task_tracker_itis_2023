class TaskMailer < ApplicationMailer
  def notify_members_task_created(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :member }).pluck(:email))
  end

  def notify_owner_task_created(project, task)
    @project = project
    @task = task

    mail(to: project.users.where(project_memberships: { role: :owner }).pluck(:email))
  end

  def task_updated(project, task)
    @project = project
    @task = task

    project.project_memberships.each do |membership|
      mail(to: membership.user.email)
    end
  end

  def task_destroyed(project, task_name, project_name)
    @project = project
    @task_name = task_name
    @project_name = project_name
    project.project_memberships.each do |membership|
      mail(to: membership.user.email)
    end
  end
end
