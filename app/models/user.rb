class User < ApplicationRecord
	include Clearance::User

	mount_uploader :profilepic, ImageUploader

	validates :email, presence: {message: "Please fill-in all fields" }
	validates :email, uniqueness: { message: "must be new"}
	validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" } 
	validates :password, length: { minimum: 6, message: "Password must be at least 6 characters" }, on: :create
end
