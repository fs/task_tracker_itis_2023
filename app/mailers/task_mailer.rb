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

  #TODO: FIX THE task_delete METHOD SO IT SENDS EACH OF THE PROJECT'S PARTICIPANTS THEIR OWN CUSTOME EMAIL!
  def task_deleted(task_name, task_description, project, user)
    @task_name = task_name
    @task_description = task_description
    @project = project
    @project_memberships = ProjectMembership.where(project_id: project.id)

    if deleter_is_owner?(@project_memberships, user)
      mail(to: user.email, subject: "You have deleted a task in your own project!")
      @project_memberships.each do |membership|
        mail(to: membership.user.email, subject: "Opps! A task has been deleted from a project you are a participant of!")
      end
    elsif !deleter_is_owner?(@project_memberships, user)
      @project_memberships.each do |membership|
        if membership.role == 'owner'
          mail(to: membership.user.email, subject: "A task has been deleted from your project!")
        elsif membership == 'member' && membership.user_id == user.id
          mail(to: membership.user.email, subject: "You have deleted a task from a project you are a participant of!")
        else
          mail(to: membership.user.email, subject: "Someone has deleted a task from a project you are a participant of!")
        end
      end
    end

  end

  private
  def deleter_is_owner?(project_memberships, user)
    project_memberships.each do |membership|
      if membership.user_id == user.id
        return true
      else
        return false
      end
    end
  end

end
