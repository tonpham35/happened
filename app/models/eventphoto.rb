class Eventphoto < ApplicationRecord
	belongs_to :event
	mount_uploader :photo, ImageUploader

	def self.datetime(img_file)
		data = Exif::Data.new(img_file)
		return datetime = data.date_time	
	end

	def self.latitude(img_file)
		data = Exif::Data.new(img_file)
		return datetime = data.gps_latitude	
	end

	def self.longitude(img_file)
		data = Exif::Data.new(img_file)
		return datetime = data.gps_longitude
	end	
end
