F00px.configure do |config|
  config.consumer_key = Figaro.env.five_hundred_pixels_consumer_key
  config.consumer_secret = Figaro.env.five_hundred_pixels_consumer_secret
end
