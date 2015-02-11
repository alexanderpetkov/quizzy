class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  has_and_belongs_to_many :questions

  has_secure_password
end
