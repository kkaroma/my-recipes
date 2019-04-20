class Chef < ApplicationRecord
	validates :chefname, presence: true
	validates :email, presence: true
	has_many :recipes, dependent: :destroy
	has_secure_password
	validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
	has_many :comments, dependent: :destroy

end