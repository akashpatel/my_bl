Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'ac9f6785d79107b2ebc77ce5f15ca0f1', 'bb4d75bfd1220cbd0d92e1d4ae6b96be'
end