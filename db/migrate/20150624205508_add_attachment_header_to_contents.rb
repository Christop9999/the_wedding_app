class AddAttachmentHeaderToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :header
    end
  end

  def self.down
    remove_attachment :contents, :header
  end
end
