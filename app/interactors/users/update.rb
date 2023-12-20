module Users
  class Update
    include Interactor::Organizer

    organize Users::Save
  end
end
