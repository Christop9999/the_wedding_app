class WeddingGuest < ActiveRecord::Base

belongs_to :wedding_part, class_name: "Wedding", foreign_key: 'wedding_id'
belongs_to :guest, class_name: 'User', foreign_key: "guest_id"



def self.request(user, wedding)
	transaction do 
		guest = create(user_id: user, wedding_id: wedding)
	end
end


end

