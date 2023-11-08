module Tasks
  class Destroy
    include Interactor::Organizer

    organize Tasks::Destroys::DestroyRecord,
             Tasks::Destroys::SendNotification
  end
end
