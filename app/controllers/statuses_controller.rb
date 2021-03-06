class StatusesController < ApplicationController
    def dashboard; end

    def index
        #@statuses = Status.all
        @statuses = Status.paginate(page: params[:page], per_page: 2)
    end

    def create
        @status = Status.new(status_params)
        if @status.save!
            StatusMailer.with(status: @status).new_status_email.deliver_now
          flash[:notice] = 'Status created successfully & Mail has been sent'
          redirect_to status_path(@status)
        else
          render action: :new
        end
    end

    def new
        @status = Status.new
        @tasks = @status.tasks.build
    end

    def show
        @status = Status.find(params[:id])
        @tasks = @status.tasks
    end

    def update
        @status = Status.find(params[:id])
        if @status.update(status_params)
          flash[:notice] = 'Status updated successfully.'
          redirect_to @status
        else
          render 'edit'
        end
    end

    def edit
        @status = Status.find(params[:id])
    end

    def destroy
        Status.find(params[:id]).destroy
        flash[:alert] = 'Status deleted successfully '
        redirect_to root_path
    end

    private
    def status_params
        params.require(:status).permit(:date, tasks_attributes: [:id, :name, :pr, :houes, :_destroy ])
    end
end
