module Comments
  class Save
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Invalid comment details") unless comment.valid?
      comment.save
    end
  end
end
