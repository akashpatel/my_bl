Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '246640008681725', '7031571d55d52be749d0da2409ec4bf1'
end