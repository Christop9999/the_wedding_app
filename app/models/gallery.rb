class Gallery < ActiveRecord::Base

	belongs_to :user
	belongs_to :wedding
	has_many :pictures, :dependent => :destroy
	
end
