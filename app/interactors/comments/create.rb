module Comments
  class Create
    include Interactor::Organizer

    organize Comments::Creates::PrepareParams,
             Comments::Save
  end
end
