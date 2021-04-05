class User < ApplicationRecord
  with_options on: :step1 do
    validates :name, presence: true
    validates :email,presence: true ,uniqueness: true
    validates :password_digest, presence: true, uniqueness: true
  end

    validates :image,presence: true, on: :update
    validates :introduce,presence: true, length: {minimum:15}, on: :update


  has_many :books
  has_many :rooms
  mount_uploader :image, ImageUploader
  has_secure_password
end
