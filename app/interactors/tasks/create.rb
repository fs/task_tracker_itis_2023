module Tasks
  class Create
    include Interactor::Organizer

    organize Tasks::PrepareParams,
             Tasks::Save
  end
end
