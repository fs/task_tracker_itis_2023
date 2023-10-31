module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Fail..") unless comment.destroy
      context.notice = "comment successfully deleted"
    end
  end
end