module Projects
  class Create
    include Interactor::Organizer

    organize Projects::Save,
             Projects::Create::CreateOwner
  end
end
