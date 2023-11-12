module Tasks
  class Destroy
    include Interactor::Organizer

    organize Tasks::Destroy::DestroyRecord,
             Tasks::Destroy::SendNotification
  end
end