class PrepareParams
  include Interactor

  def call
    assignment_params = context.assignment_params

    assignment_params[:created_at] = Time.zone.now

    context.validated_params = assignment_params
  end
end
