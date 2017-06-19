class User < ApplicationRecord
	include Clearance::User

	mount_uploader :profilepic, ImageUploader

	validates :email, presence: {message: "Please fill-in all fields" }
	validates :email, uniqueness: { message: "must be new"}
	validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" }
	validates :password, length: { minimum: 6, message: "Password must be at least 6 characters" }, on: :create

	has_many :stories, dependent: :destroy
  	has_many :events, dependent: :destroy
	has_many :friendships, dependent: :destroy
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	has_many :story_members
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
