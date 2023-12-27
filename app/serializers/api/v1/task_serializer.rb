module Api
  module V1
    class TaskSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :status, :deadline_at

      attribute :deadline_at do
        object.deadline_at.strftime("%Y-%m-%d")
      end
    end
  end
end