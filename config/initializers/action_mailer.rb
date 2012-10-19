smtp_settings = {
  :address              => "mail.ZFoundation.com",
  :port                 => 587,
  :domain               => 'ZFoundation.com',
  :user_name            => 'info@ZFoundation.com',
  :password             => 'add a password',
  :authentication       => :login,
  :enable_starttls_auto => true,
  :openssl_verify_mode => 'none'
}


ActionMailer::Base.smtp_settings = smtp_settings

if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = { :address => "localhost", :port => 1025 }
  
  url_opts = {
    :host => Rails.application.config.domain,
    :port => 2222
  }

  Rails.application.config.action_mailer.default_url_options = url_opts
  Rails.application.config.action_controller.default_url_options = url_opts
  ActionMailer::Base.default_url_options = url_opts
end

if Rails.env.production?
  url_opts = {
    :host => Rails.application.config.domain
  }  

  Rails.application.config.action_mailer.default_url_options = url_opts
  Rails.application.config.action_controller.default_url_options = url_opts
  ActionMailer::Base.default_url_options = url_opts
end