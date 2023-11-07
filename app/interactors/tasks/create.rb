module Tasks
  class Create
    include Interactor::Organizer

    delegate :project, :task, to: :context

    organize Tasks::Creates::PrepareParams,
             Tasks::Save
    after do
      owner = project.users.find_by(project_memberships: { role: "owner" })
      members = project.users.where.not(id: owner.id)
      TaskMailer.task_created_owner(owner, task).deliver_later if owner.present?
      members.each do |member|
        TaskMailer.task_created_member(member, task).deliver_later
      end
    end
  end
end
