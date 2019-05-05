class User < ApplicationRecord
	belongs_to :role
	has_many :user_infos
	has_one_attached :photos
end
