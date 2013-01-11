class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :objects_id, :img, :image, :carma, :views, :img_file_name
  
  belongs_to :objects

  has_attached_file :img, :styles => { :medium => "800x800>", :thumb => "100x100#", :list => "220x220#"},
      :url =>"/system/:class/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:style/:basename.:extension"
  
  before_save :basename
  #one convenient method to pass jq_upload the necessary information
  Paperclip.interpolates :objects do |attachment, style|
    attachment.instance.albums
  end
  
  def albums
    self.album_id
  end
  
  def to_jq_upload
    {
      "name" => img.url,
      "size" => img.size,
      "url" => img.url,
      "thumbnail_url" => img.url(:thumb),
      "delete_url" => photo_path(:id => id),
      "delete_type" => "DELETE"
    }
  end

private
  def basename
    if self.img.dirty?
      new_filename = (Time.now + Random.new.rand(1..99)).to_i.to_s
      extension = File.extname(img_file_name).downcase
      self.img.instance_write :file_name, "#{new_filename}#{extension}"
      self.img_file_name = "#{new_filename}#{extension}"
    end
  end
end
