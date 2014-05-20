class AddAttachmentAttachmentToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :attachment
    end
  end

  def self.down
    drop_attached_file :pictures, :attachment
  end
end
