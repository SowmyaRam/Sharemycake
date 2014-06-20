class Member < ActiveRecord::Base
  validates :first_name, :email, presence: true;
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create 
  validates :email, uniqueness: true;
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :organizations, :through => :events
end
