module GraphqlErrors
  def formatted_errors(model)
    model.errors.map do |error|
      path = ["attributes", error.attribute.to_s.camelize(:lower)]
      {
        path: path,
        message: error.message
      }
    end
  end
end
