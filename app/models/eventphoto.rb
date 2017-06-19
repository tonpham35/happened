class Eventphoto < ApplicationRecord
	belongs_to :event
	mount_uploader :photo, ImageUploader

	def self.datetime(img_file)
		if Exif::Data.new(img_file).date_time != nil
			data = Exif::Data.new(img_file)
			datetime = data.date_time
		else
			datetime = nil
		end

		return datetime	
	end

	def self.latitude(img_file)
		if Exif::Data.new(img_file).gps_latitude != nil 
		data = Exif::Data.new(img_file) 
		latitude = data.gps_latitude
			if data.gps_latitude_ref == "S"
				latitude = (-1) * latitude
			end
		else
			latitude = nil
		end
		
		return latitude
	end

	def self.longitude(img_file)
		if Exif::Data.new(img_file).gps_longitude != nil 
		data = Exif::Data.new(img_file) 
		longitude = data.gps_longitude
			if data.gps_longitude_ref == "W"
				longitude = (-1) * longitude
			end
		else
			longitude = nil
		end
		
		return longitude
	end

end
