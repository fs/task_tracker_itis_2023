class ProjectMailer < ApplicationMailer
  def project_created(project, user)
    @project = project

    mail(to: user.email)
  end
end
