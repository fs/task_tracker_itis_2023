# frozen_string_literal: true


module Tasks
  class Create
    include Interactor::Organizer
    organize Tasks::Creates::PrepareParams,
             Tasks::Save
  end
end
