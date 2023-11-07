class ProjectMailer < ApplicationMailer
  def project_created(project, user)
    @project = project

    mail(to: user.email)
  end

  def project_updated(project, user)
    @project = project

    mail(to: user.email)
  end

  def project_destroyed(user)
    mail(to: user.email)
  end
end
