module Api
  module V1
    class TaskSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :created_at, :updated_at
    end
  end
end
