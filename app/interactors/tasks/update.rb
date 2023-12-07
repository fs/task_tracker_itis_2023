# frozen_string_literal: true

module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Create::PrepareParams,
             Tasks::UpdatingCheck
  end
end
