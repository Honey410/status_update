class StatusMailer < ApplicationMailer
  def new_status_email
    @status = params[:status]

    mail(to: 'bennyjhamnani@gmail.com', subject: "Training Status #{@status.date}")
    
  end
end
