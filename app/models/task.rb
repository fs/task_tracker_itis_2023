class Task < ApplicationRecord
  belongs_to :project

  validate :deadline_is_valid
    def deadline_is_valid
      if Date.today >= deadline
        errors.add("Введи корректную дату дедлайна, овощ!")
    end
  end  
end