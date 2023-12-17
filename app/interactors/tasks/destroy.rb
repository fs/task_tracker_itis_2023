module Tasks
  class Destroy
    include Interactor

    delegate :task, to: :context

    def call
      task.destroy
    end
  end
end