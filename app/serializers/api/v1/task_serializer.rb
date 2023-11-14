module Api
  module V1
    class TaskSerializer < ActiveModel::Serializer
      attributes :id, :name, :description, :status, :deadline_at

      attribute :deadline_at do
        Time::DATE_FORMATS[:my_datetime] = "%Y-%m-%d"
        object.deadline_at.to_s(:my_datetime)
      end
    end
  end
end
