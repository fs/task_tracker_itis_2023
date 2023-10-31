class UpdateAssignment
  include Interactor

  def call
    assignment = context.assignment
    updated_attributes = context.updated_attributes

    if assignment.update(updated_attributes)
      context.assignment = assignment
      context.message = "Assignment Gracefully Updated"
    else
      context.fail!(message: "Failed to update the assignment")
    end
  end
end
