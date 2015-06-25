class Content < ActiveRecord::Base
  belongs_to :wedding

  has_attached_file :header, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :header, :content_type => /\Aimage\/.*\Z/
end
