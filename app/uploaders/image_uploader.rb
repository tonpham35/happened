class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # include CarrierWaveDirect::Uploader

  
# CarrierWave.configure do |config|
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider:              'AWS',
#     aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
#     aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
#     :region                 => 'ap-southeast-1'
#   }
#   config.fog_directory  = ENV["AWS_S3_BUCKET"]
# end

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # include CarrierWave:MimeTypes
  # process :set_content_type

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  def fix_exif_rotation #this is my attempted solution
    manipulate! do |img|
      img.tap(&:auto_orient)
    end
  end


  # Create different versions of your uploaded files:
  version :thumb do
    process :fix_exif_rotation
    process resize_to_limit: [60, 60]
  end

  version :card do
    process :fix_exif_rotation
    process resize_to_limit: [nil, 300]
  end

  version :carousel do
    process :fix_exif_rotation
    process resize_to_limit: [nil, 500]
  end  

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
