class ProjectMembership < ApplicationRecord
  extend Enumerize

  ROLES = %i[owner member].freeze

  belongs_to :user
  belongs_to :project

  enumerize :role, in: ROLES, predicates: true, scope: :shallow, default: :member
end