class Save
  include Interactor

  def call
    assignment = Assignment.new(context.validated_params)

    if assignment.save
      context.assignment = assignment
      context.message = "Assignment Gracefully Created"
    else
      context.fail!(errors: assignment.errors.full_messages)
    end

  end
end
