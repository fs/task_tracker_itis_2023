class DeleteProject
  include Interactor

  def call
    project = context.project

    if project.destroy
      context.message = "Project Gracefully Deleted"
    else
      context.fail!(message: "Failed to delete the projects")
  end
end
end
