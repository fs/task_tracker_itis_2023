module Tasks

  class Create

    include Interactor::Organizer

    organize Tasks::Create::PreparedParams,
             Tasks::Save
  end
end