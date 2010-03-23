class Notifier < ActionMailer::Base
  
  def signup_notification(recipient)
     recipients recipient.email
     from       "noreply@someotherlocationontheweb.com"
     subject    "New account information"
     body       :account => recipient
   end

end
