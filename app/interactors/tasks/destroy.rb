module Tasks
  class Destroy
    include Interactor::Organizer

    delegate :project, :task, to: :context

    organize Tasks::Destroy::SendMessages,
             Tasks::Destroy::DestroyTask
  end
end
