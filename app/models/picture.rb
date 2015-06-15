class Picture < ActiveRecord::Base

  belongs_to :gallery

  has_attached_file :image,
    :styles => { :medium => "500x300>", :thumb => "100x100>", :large => "700x700" }, :default_url => "/images/:style/missing.png",
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :image

end