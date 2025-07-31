Twilio.configure do |config|
# TEST  
  # config.account_sid = 'ACac26d02118ddecfba44ec5d91aed286f'
  # config.auth_token = '705a9d6ac14d5e30613deb639e95415d'
  
# LIVE  
  config.account_sid = ENV["TWILIO_SID"]
  config.auth_token = ENV["TWILIO_AUTH"]
end