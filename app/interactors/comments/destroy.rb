module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      context.fail!(error: "Can't destroy") unless comment.destroy
    end
  end
end
