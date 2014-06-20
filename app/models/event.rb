class Event < ActiveRecord::Base
  belongs_to :member
  has_one :organization
  validates :event_name, :event_date, :venue, :event_desc, presence: true; 
end
