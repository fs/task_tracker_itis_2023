module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      if comment.destroy
        context.status = :success
      else
        context.fail!(error: "Failed to delete comment")
      end
    end
  end
end
