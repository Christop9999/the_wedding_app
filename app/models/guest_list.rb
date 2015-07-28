class GuestList < ActiveRecord::Base
  belongs_to :wedding
 validates :first_name, presence: true
  validates :last_name, presence: true
end
