class StatusMailer < ApplicationMailer
  def new_status_email
    @status = params[:status]
    mail(to: '171210107020@aiet.edu.in', subject: "Training-Status-#{@status.date}")
  end
  
end
