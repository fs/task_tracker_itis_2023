module Comments

  class Update
    include Interactor

    delegate :comment, :comment_params,to: :context

    def call
      context.fail!(error: "Something went wrong!") unless comment.update(comment_params)
      context.notice = "Comment has been updated!"
    end
  end
end