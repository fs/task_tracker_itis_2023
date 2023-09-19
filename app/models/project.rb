class Project < ApplicationRecord
  validates :name, :description, presence: true
end
