class Organization < ActiveRecord::Base
  belongs_to :member
  belongs_to :event
end
