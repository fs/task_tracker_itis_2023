module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Create::PrepareParams,
             Tasks::Updating
  end
end
