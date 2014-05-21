#encoding: utf-8
class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :product_id, :attachment

  belongs_to :product

  has_attached_file :attachment, :styles => { large: '600x600>', medium: '300x300>', thumb: '100x100>' }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

  validate :check_dimensions

  def check_dimensions
    dim = {x: 800, y: 600}
    temp_file = attachment.queued_for_write[:original]
    unless temp_file.nil?
      dimensions = Paperclip::Geometry.from_file(temp_file)
      width = dimensions.width
      height = dimensions.height
      if width != dim[:x] && height != dim[:y]
        errors.add(:attachment, "debe ser de #{dim[:x]}x#{dim[:y]} la imágen que seleccionó mide #{width.to_i.to_s}x#{height.to_i.to_s}")
      end
    end
  end
end
