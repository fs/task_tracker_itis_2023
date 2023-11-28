module Types
  class TaskStatusType < Types::BaseEnum
    value "UNSTARTED", value: "unstarted", description: "Unstarted"
    value "STARTED", value: "started", description: "Started"
    value "FINISHED", value: "finished", description: "Finished"
  end
end
