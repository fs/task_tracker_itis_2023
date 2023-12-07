# frozen_string_literal: true

module Comments
  class Create
    include Interactor::Organizer

    organize Comments::Create::PrepareParams,
             Comments::Save
  end
end