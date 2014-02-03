require 'development_mail_interceptor'
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.delivery_method = :mailhopper

ActionMailer::Base.smtp_settings = {
   :address => 'smtp.gmail.com',
   :port => 587,
   :domain => 'midiaindoor.com.br',
   :authentication => :plain,
   :user_name => 'sistema@midiaindoor.com.br',
   :password => '328A78',
   :enable_starttls_auto => true
}
