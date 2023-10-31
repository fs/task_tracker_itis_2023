module Comments
  class Create
    include Interactor::Organizer

    organize Comments::Save
  end
end
