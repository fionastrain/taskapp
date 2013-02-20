class Teammate < ActiveRecord::Base
  attr_accessible :email, :name
  validates :name, :presence => true
  validates :name, :uniqueness => {:value => true, :message => "Teammate already exists"}
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i}
end
