class Wedding < ActiveRecord::Base
	has_many :venues
	accepts_nested_attributes_for :venues
	
	validates :name, presence: true,
				     length: {minimum: 3}



	

		


end
