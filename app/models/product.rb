class Product < ActiveRecord::Base
  attr_accessible :description

  has_many :pictures
end
