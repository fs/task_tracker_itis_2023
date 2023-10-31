class UpdateProject
  include Interactor

  def call
    project = context.project
    updated_attributes = context.updated_attributes

    if project.update(updated_attributes)
      context.project = project
      context.message = "Project Gracefully Updated"
    else
      context.fail!(message: "Failed to update the project")
    end
  end
end
