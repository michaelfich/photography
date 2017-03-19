Rails.application.config.middleware.use OmniAuth::Builder do
  consumer_key = Figaro.env.five_hundred_pixels_consumer_key
  consumer_secret = Figaro.env.five_hundred_pixels_consumer_secret
  provider :fiveHundredPx, consumer_key, consumer_secret
end
