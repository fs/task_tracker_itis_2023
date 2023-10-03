class TasksController <  ApplicationController
     before_action :get_proj, only: %i[new create show index edit update destroy ]

        def get_proj

            @proj = Project.find(params[:project_id])
        end

        def index
            @tasks = Task.all
        end

        def new 
            @task = @proj.tasks.new
        end

        def create
            @task = @proj.tasks.new(task_params)
            if(@task.save)
                redirect_to project_path(@proj)
            else 
                render :new
            end
        end

        def show; end

        def edit
            @task = @proj.tasks.find_by(id: params[:id])
        
        end

        def update
            @task = @proj.tasks.find_by(id: params[:id])
            @task.update(task_params)
            redirect_to '/'
        end

        def destroy
            @task = @proj.tasks.find(params[:id])
            @task.destroy
            redirect_to '/'
        end

    

        def task_params
            params.require(:task).permit(:name, :description, :state, :deadline)
        end
    end
