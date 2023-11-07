module Tasks
    class Save
         include Interactor
         delegate :task_params, :project, :task, to: :context 
         def call
            context.task = project.tasks.build(task_params)
            context.fail!(error: "Invalid data") unless task.save
         end
    end
end
