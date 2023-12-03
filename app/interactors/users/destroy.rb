module Users
  class Destroy
    include Interactor::Organizer

    organize Users::Destroys::DestroyRecord
    # Users::Destroys::SendNotification
  end
end
