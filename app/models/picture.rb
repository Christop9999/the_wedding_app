class Picture < ActiveRecord::Base

  belongs_to :gallery


  has_attached_file :image,
    :styles => { 
    	:medium => "500x300>", 
    	:thumb => "100x100!", 
    	:large => "700x700" }, 
    :convert_options => {
   		:thumb => "-quality 75 -strip"
   	},
    :default_url => "/images/:style/missing.png",
    	:path => ":rails_root/public/images/:style/:id/:filename",
   	    :url  => "/images/:style/:id/:filename"


  do_not_validate_attachment_file_type :image

end