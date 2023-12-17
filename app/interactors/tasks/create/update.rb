module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Save
  end
end