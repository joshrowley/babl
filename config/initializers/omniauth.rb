# 3.1.3
Rails.application.config.middleware.use OmniAuth::Builder do
      
  provider :facebook, '305526829561222', '53985e48bc5b0c0318d1567763477f9b'

  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  # provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'

end