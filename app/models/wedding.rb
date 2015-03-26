class Wedding < ActiveRecord::Base
	has_many :venues
<<<<<<< HEAD
	accepts_nested_attributes_for :venues
=======
	
>>>>>>> fcb9577bfd1c4afb01b4111aab83f7806577c739
	
	validates :name, presence: true,
				     length: {minimum: 3}



	

		


end
