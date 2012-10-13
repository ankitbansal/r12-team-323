Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, '536578256357658', 'd28f1db16793a1ed2b0a675ccf935ec7'
end