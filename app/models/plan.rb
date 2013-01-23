class Plan < ActiveRecord::Base
  attr_accessible :title, :description, :floor,:img, :objects_id,
                    :img_file_name
  
  validates :objects_id , :floor, :presence => true

  #Определяем файлы для paperclip
  has_attached_file :img, :styles => { :medium => "800x500>", :thumb => "100x100>" },
      :url =>"/system/:class/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"

  before_save :basename
  belongs_to :objects
  has_many :room
  
private
  def basename
    if self.img.dirty?
      new_filename = Time.now.to_i.to_s
      extension = File.extname(img_file_name).downcase
      self.img.instance_write :file_name, "#{new_filename}#{extension}"
      self.img_file_name = "#{new_filename}#{extension}"
    end
  end   
end
