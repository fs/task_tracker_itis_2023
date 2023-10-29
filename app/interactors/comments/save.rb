module Comments
  class Save
    include Interactor

    delegate :comment, :comment_params, to: :context

    before do
      context.comment ||= Comment.new
    end

    def call
      context.fail!(error: "Invalid data") unless comment.update(comment_params)
    end
  end
end
