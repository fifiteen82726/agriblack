OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # /provider :developer unless Rails.env.production?
  provider :facebook, '556969551160164', '386e28081cd00ff3067132a8490fcfb7'
end
