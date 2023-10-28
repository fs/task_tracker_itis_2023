module Comments

  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Can't delete the comment!") unless comment.destroy
      context.notice = "Comment has been deleted!"
    end
  end
end