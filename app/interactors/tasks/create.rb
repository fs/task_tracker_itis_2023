# frozen_string_literal: true

module Tasks
  class Create
    include Interactor::Organizer

    organize Tasks::Create::PrepareParams,
             Tasks::Save
  end
end
