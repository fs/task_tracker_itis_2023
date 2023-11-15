module Api
    module V1
      class ProjectSerializer < ActiveModel::Serializer
        attributes :id, :name, :description, :status, :deadline_at, :project_id, :created_at, :updated_at
  
        attribute :comments_count do
          object.comments.size
        end
  
        attribute :capitalize_name do
          object.name.capitalize
        end
  
        has_many :comments
      end
    end
  end
  