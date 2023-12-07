# frozen_string_literal: true

module Comments
  class Update
    include Interactor::Organizer

    organize Comments::Create::PrepareParams,
             Comments::UpdatingCheck
  end
end