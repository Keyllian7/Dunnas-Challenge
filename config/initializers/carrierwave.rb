CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: ENV["AWS_REGION"],
    endpoint: "https://s3.sa-east-1.amazonaws.com"
  }

  config.fog_directory = ENV["AWS_BUCKET_NAME"]
  config.fog_public = false
  config.fog_attributes = {"Cache-Control" => "max-age=315576000"}
end
