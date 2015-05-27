class Venue < ActiveRecord::Base
  belongs_to :wedding
  validates :name, presence: true,
				     length: {minimum: 3}
	validates :description, presence: true,
				     length: {minimum: 3}
 	validates :street, presence: true,
				     length: {minimum: 3}
	validates :city, presence: true,
				     length: {minimum: 3}
	validates :zip, presence: true,
				     length: {minimum: 3}

	validates :state, presence: true,
				     length: {minimum: 3}
	validates :url, presence: true,
				     length: {minimum: 3}
end
