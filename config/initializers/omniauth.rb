OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK-APP-ID'], ENV['FACEBOOK-APP-SECRET']
end