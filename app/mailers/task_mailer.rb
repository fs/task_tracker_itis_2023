class TaskMailer < ApplicationMailer 
    def task_created_owner(project, task)
        @project = project 
        @task = task
        mail(to: get_users_by_role(:owner).pluck(:email))
    end

    def task_created_member(project, task)
        @project = project 
        @task = task
        mail(to: get_users_by_role(:member).pluck(:email))
    end

    def task_update(project, task)
        @project = project 
        @task = task
        mail(to: @project.users)
    end

    def task_destroy(project, task_name)
        @project = project 
        @task_name = task_name
        mail(to: @project.users)
    end




    private 
    def get_users_by_role(role)
        @project.users.where(project_memberships: { role: role })
    end
end 