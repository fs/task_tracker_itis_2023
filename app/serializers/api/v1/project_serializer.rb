module Api
  module V1
    class ProjectSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :created_at, :updated_at

      attribute :tasks_count do
        object.tasks.size
      end

      attribute :capitalize_name do
        object.name.capitalize
      end

      has_many :tasks, serializer: TaskSerializer
    end
  end
end
