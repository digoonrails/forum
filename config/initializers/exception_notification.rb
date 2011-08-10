if defined?(ExceptionNotifier)
  Forum::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => Settings.exception.subject,
    :sender_address => Settings.mail.user_name,
    :exception_recipients => Settings.exception.email
end