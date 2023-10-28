module Comments

  class Create
    include Interactor::Organizer

    organize Comments::Create::PreparedParams,
             Comments::Save
  end
end