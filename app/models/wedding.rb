class Wedding < ActiveRecord::Base
	has_many :venues
	belongs_to :document
	 has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	accepts_nested_attributes_for :document
validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
	validates :name, presence: true,
				     length: {minimum: 3}



	

		


end
