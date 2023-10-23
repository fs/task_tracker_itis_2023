class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  has_many :comments

  validate:deadline_not_earlier_than_created


   def deadline_not_earlier_than_created
    if deadline.present? && created_at.present? && deadline < created_at
      errors.add(:deadline, "Can't be earlier than the asssignment's creation date")
    end
  end

  validates_uniqueness_of :assignment_name, scope: :project_id, message: ":This nomination for assignment already exists in this project."
end
