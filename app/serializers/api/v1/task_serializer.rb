module Api
    module V1
      class TaskSerializer < ActiveModel::Serializer
        attributes :id, :name, :description, :status
        attribute :deadline_at do
          object.deadline_at.strftime("%d-%m-%Y %H:%M")
        end
            
      belongs_to :project
    end
  end
end
  