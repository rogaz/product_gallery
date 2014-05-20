class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :product_id, :attachment

  belongs_to :product

  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
