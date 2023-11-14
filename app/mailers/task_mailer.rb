class TaskMailer < ApplicationMailer

  before_action :set_task_and_project
  def task_created_to_owner(project, task)
    mail(to: project.users.where(project_memberships: { role: :owner }).pluck(:email))
  end

  def task_created_to_member(project, task)
    mail(to: project.users.where(project_memberships: { role: :member }).pluck(:email))
  end

  def task_updated(project, task)
    mail(to: project.users.pluck(:email))
  end

  def task_destroyed_to_deleter(project, task, user)
    mail(to: user.email)
  end

  def task_destroyed_to_owner(project, task, user)
    mail(to: user.email)
  end

  def task_destroyed_to_members(project, task, users)
    mail(to: users.pluck(:email))
  end

  private

  def set_task_and_project
    @task = task
    @project = project
  end
end
