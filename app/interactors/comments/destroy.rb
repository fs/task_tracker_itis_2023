module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Comment didn't delete") unless comment.destroy
    end
  end
end