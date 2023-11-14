class TaskMailer < ApplicationMailer
  def task_created_to_owner(project, task)
    @task = task
    @project = project

    mail(to: project.users.where(project_memberships: { role: :owner }).pluck(:email))
  end

  def task_created_to_member(project, task)
    @task = task
    @project = project

    mail(to: project.users.where(project_memberships: { role: :member }).pluck(:email))
  end

  def task_updated(project, task)
    @task = task
    @project = project

    mail(to: project.users.pluck(:email))
  end

  def task_destroyed(project, task)
  end
end
