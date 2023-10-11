class Project < ApplicationRecord
  validates :name, :description, presence: true
  has_many :assignments, dependent: :destroy
end
