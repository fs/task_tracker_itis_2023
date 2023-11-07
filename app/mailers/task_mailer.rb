class TaskMailer < ApplicationMailer
  def task_created(project, task)
    @project_memberships = ProjectMembership.find_by(project_id: project.id)

    @project_memberships.each do |member|
      if member.role == "owner"
        owner_create(project, task, member)
      else
        membership_create(project, task, member)
      end
    end
  end

  def task_updated(project, task)
    @project = project
    @task = task
    @project_memberships = ProjectMembership.find_by(project_id: project.id)
    
    @project_memberships.each do |member|
      mail(to: member.email)
    end
  end

  def task_destroyed(project, task, current_user)
    @project_memberships = ProjectMembership.find_by(project_id: @project.id)

    @project_memberships.each do |member|
      if member.user_id == current_user.id and member.role == "member"
        task_member_destroyer(project, task, member)
      elsif member.user_id == current_user.id and member.role == "owner"
        task_owner_destroyer(project, task, member)
      elsif member.user_id != current_user.id and member.role == "member"
        task_member_destroyed(project, task, member)
      elsif member.user_id != current_user.id and member.role == "owner"
        task_owner_destroyed(project, task, member)
      end
    end
  end

  private
  
  def task_member_destroyer(project, task, member)
    @project = project
    @task = task
    mail(to: member.email)
  end
  
  def task_owner_destroyer(project, task, member)
    @project = project
    @task = task
    mail(to: member.email)
  end

  def task_member_destroyed(project, task, member)
    @project = project
    @task = task
    mail(to: member.email)
  end

  def task_owner_destroyed(project, task, member)
    @project = project
    @task = task
    mail(to: member.email)
  end

  def task_owner_create(project, task, member)
    @project = project
    @task = task
    mail(to: member.email)
  end

  def task_member_create(project, task, member)
    @project = project
    @task = task
    mail(to: member.email)
  end
end
