class Photo < ApplicationRecord
	def datetime(img_file)
		data = Exif::Data.new('img_file')
		return datetime = data.date_time	
	end

	def latitude(img_file)
		data = Exif::Data.new('img_file')
		return datetime = data.gps_latitude	
	end

	def longitude(img_file)
		data = Exif::Data.new('img_file')
		return datetime = data.gps_longitude
	end	
end
