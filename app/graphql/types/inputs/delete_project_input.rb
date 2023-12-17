module Types 
    module Inputs 
        class DeleteProjectInput < Types::BaseInputObject 
            argument :id, ID, required: true
        end 
    end
end