# frozen_string_literal: true

module Comments
  class Destroy
    include Interactor
    delegate :comment, to: :context

    def call
      context.fail!(error: "Comment destruction failed") unless comment.destroy
    end
  end
end
