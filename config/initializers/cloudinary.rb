Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_NAME']
  config.api_key = ENV['API_KEY']
  config.api_secret = ENV['API_SECRET']
  config.secure = ENV['CLOUDINARY_SECURE']
  config.cdn_subdomain = ENV['CLOUDINARY_CDN_SUBDOMAIN']
end
