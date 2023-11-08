module Tasks
  class Destroy
    include Interactor::Organizer

    organize Tasks::Destroyes::DestroyRecord,
             Tasks::Destroyes::SendNotification
  end
end
