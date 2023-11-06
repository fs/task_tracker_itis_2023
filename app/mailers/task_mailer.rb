class TaskMailer < ApplicationMailer
  def task_created(task, project)
    @task = task
    @project = project
    @project_memberships = project.project_memberships.where(role: %w[owner member])

    send_emails("New Task Created", "New Task Created in", project)
  end

  def task_updated(task, project)
    @task = task
    @project = project
    @project_memberships = project.project_memberships

    send_emails("Task Updated", "A task has been updated", project)
  end

  def task_destroyed(task_name, task_description, project, user)
    @task_name = task_name
    @task_description = task_description
    @project = project
    @project_memberships = project.project_memberships

    if user_is_owner?(user)
      send_owner_deletion_emails(user)
    else
      send_member_deletion_emails(user)
    end
  end

  private

  def user_is_owner?(user)
    @project_memberships.exists?(user_id: user.id, role: "owner")
  end

  def send_emails(subject_prefix, subject_suffix, _project)
    @project_memberships.each do |membership|
      subject = "#{subject_prefix} in #{subject_suffix} Your Project!"
      subject = "#{subject_prefix} in Project!" if membership.role == "member"

      mail(to: membership.user.email, subject: subject)
    end
  end

  def send_owner_deletion_emails(user)
    mail(to: user.email, subject: "You have deleted a task in your own project!")

    @project_memberships.each do |membership|
      mail(to: membership.user.email, subject: "Opps! A task has been deleted from a project you are a participant of!")
    end
  end

  def send_member_deletion_emails(user)
    @project_memberships.each do |membership|
      subject = if membership.role == "owner"
                  "A task has been deleted from your project!"
                elsif membership.role == "member" && membership.user_id == user.id
                  "You have deleted a task from a project you are a participant of!"
                else
                  "Someone has deleted a task from a project you are a participant of!"
                end

      mail(to: membership.user.email, subject: subject)
    end
  end
end
