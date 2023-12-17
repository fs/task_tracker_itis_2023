module Comments
  class Update
    include Interactor::Organizer

    organize Comments::Save
  end
end