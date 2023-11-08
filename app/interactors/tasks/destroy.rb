module Tasks
  class Destroy
    include Interactor::Organizer

    organize Tasks::Destroyes::SendNotification,
             Tasks::Destroyes::DestroyRecord
  end
end
