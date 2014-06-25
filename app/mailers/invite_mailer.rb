class InviteMailer < ActionMailer::Base
  default from: "sowmya.rails.test@gmail.com"
  
  def send_invite(event)
    @event = event
    @email_list = event.email_id.split(",")
    @email_list.each do |item|
      mail to: item, subject: 'Time to celebrate!!!'
    end
  end
  
end
