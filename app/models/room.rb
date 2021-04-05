class Room < ApplicationRecord
  validates :name,  presence: true
  validates :introduce, presence: true,length: {minimum:15}
  validates :price, presence: true
  validates :image, presence: true
  validates :address,  presence: true



  belongs_to :user
  belongs_to :book, optional: true
  mount_uploader :image, ImageUploader

  def self.search(address,search)
    if address
      Room.where(['address LIKE ?', "%#{address}%"])
    elsif search
      Room.where(['address LIKE ? OR price LIKE ? OR introduce LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end
end
