module Comments
  class Save
    include Interactor
    delegate :comment, to: :context

    def call
      context.fail!(error: "Unable to add the comment!") unless comment.save
      context.notice = "Comment has been added!"
    end
  end
end