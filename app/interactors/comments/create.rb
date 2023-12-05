# frozen_string_literal: true

module Comments
  class Create
    include Interactor
    delegate :task, :current_user, :comment_params, :comment, to: :context

    before do
      context.comment ||= Comment.new
    end

    def call
      comment_params.merge!(prepared_comment_params)
      context.fail!(error: "Invalid data") unless context.comment.update(comment_params)
    end

    def prepared_comment_params
      {
        user: current_user,
        task: task
      }
    end
  end
end
