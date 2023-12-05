module Types
  class UserRoleType < Types::BaseEnum
    value "MEMBER", value: "member", description: "Member"
    value "ADMIN", value: "admin", description: "Admin"
    value "SUPER_ADMIN", value: "super_admin", description: "Super admin"
  end
end
