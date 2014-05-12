# encoding: utf-8

class DirectUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include CarrierWaveDirect::Uploader
  #storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def default_url
     ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  end
  
  include CarrierWave::MimeTypes
  process :set_content_type
  
  process :resize_to_limit => [600, 600]

  version :thumb do
    process :resize_to_fill => [235, 132]
  end

  version :list do
    process :resize_to_fill => [470, 246]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
	

  # def filename
  #  random_token = Digest::SHA2.hexdigest("#{Time.now.utc}--#{model.id.to_s}").first(20)
  #  ivar = "@#{mounted_as}_secure_token"
  #  token = model.instance_variable_get(ivar)
  #  token ||= model.instance_variable_set(ivar, random_token)
  #  "#{token}.jpg" if original_filename
  # end
  # def initialize(*)
  #   super

  # config.fog_directory  = ENV["AWS_S3_BUCKET"]                   # required
  # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

  #   self.fog_directory = "md-sg-0002"
  # end
end
