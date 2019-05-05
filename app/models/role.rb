class Role < ApplicationRecord
	has_many :users
	validates :name, uniqueness: true
	scope :active, -> { where(is_default: true) }



	def self.active_roles
		result = {}
		self.active.each{|r| result[r.id] = r.name }
		return result
	end
end
