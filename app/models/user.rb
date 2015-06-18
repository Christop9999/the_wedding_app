class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :wedding
  has_many :pins
  
  #belongs_to :wedding 
  
  has_many :wedding_guest, foreign_key: "guest_id"
  has_many :wedding_part, through: :wedding_guest
  






def full_name
	first_name 
end

end
