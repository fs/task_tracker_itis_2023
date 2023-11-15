module Api
  module V1
    class TaskSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :status, :deadline_at

      belongs_to :project
    end
  end
end
