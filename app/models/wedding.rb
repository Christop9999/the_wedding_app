class Wedding < ActiveRecord::Base
	validates :name, presence: true,
				     length: {minimum: 3}
	validates :bride, presence: true,
				     length: {minimum: 2}
	validates :groom, presence: true,
				     length: {minimum: 2}

end
