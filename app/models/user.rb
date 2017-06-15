class User < ApplicationRecord
	include Clearance::User

	mount_uploader :profilepic, ImageUploader

	validates :email, presence: {message: "Please fill-in all fields" }
	validates :email, uniqueness: { message: "must be new"}
	validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" } 
	validates :password, length: { minimum: 6, message: "Password must be at least 6 characters" }, on: :create

	has_many :stories

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

# In app/models/user.rb    
	class User < ApplicationRecord
	    has_many :authentications, dependent: :destroy

	    def self.create_with_auth_and_hash(authentication, auth_hash)
	      user = self.create!(
	        name: auth_hash["name"],
	        email: auth_hash["extra"]["raw_info"]["email"]
	      )
	      user.authentications << authentication
	      return user
	    end

	    # grab fb_token to access Facebook for user data
	    def fb_token
	      x = self.authentications.find_by(provider: 'facebook')
	      return x.token unless x.nil?
	    end
	 end
end
