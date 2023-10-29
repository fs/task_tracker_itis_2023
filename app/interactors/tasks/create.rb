module Tasks
  class Create
    include Interactor::Organizer

    organize Tasks::Save
  end
end