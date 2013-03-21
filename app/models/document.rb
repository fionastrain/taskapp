class Document < ActiveRecord::Base
  attr_accessible :datemodified, :name
  validates :name, :presence => true
  has_many :tasks
end
