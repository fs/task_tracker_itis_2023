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
end
