module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      destroy_comment_or_fail
    end

    private

    def destroy_comment_or_fail
      unless comment.destroy
        context.fail!(error: "Failed to destroy comment")
      end
    end
  end
end
