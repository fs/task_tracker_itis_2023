class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validate:deadline_not_earlier_than_created


   def deadline_not_earlier_than_created
    if deadline.present? && created_at.present? && deadline < created_at
      errors.add(:deadline, "Can't be earlier than the asssignment's creation date")
    end
  end
end
