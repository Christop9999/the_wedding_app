class Wedding < ActiveRecord::Base
	has_many :venues
	
	validates :name, presence: true,
				     length: {minimum: 3}



	

		


end
