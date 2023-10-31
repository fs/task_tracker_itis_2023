class DeleteAssignment
  include Interactor

  def call
    assignment = context.assignment

    if assignment.destroy
      context.assignment_deleted = true
      context.message = "Assignment Gracefully Deleted"
    else
      context.fail!(message: "Failed to delete the assignment")
    end
  end
end
