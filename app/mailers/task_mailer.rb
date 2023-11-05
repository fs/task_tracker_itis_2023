class TaskMailer < ApplicationMailer
  def task_created_owner(user, task)
    @user = user
    @task = task
    @project = task.project

    mail(to: @user.email, subject: "A new task has been successfully created")
  end

  def task_created_member(user, task)
    @user = user
    @task = task
    @project = task.project

    mail(to: @user.email, subject: "A new task has been created in your project")
  end

  def task_updated(user, task)
    @user = user
    @task = task
    @project = task.project
    mail(to: @user.email, subject: "A task in your project has been updated")
  end

  def task_deleted(user)
    @user = user
    mail(to: @user.email, subject: "A task in your project has been deleted")
  end
end
