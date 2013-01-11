class Partner < ActiveRecord::Base
    attr_accessible :title,:description, :img, :img_file_name, :contacts, :on_main, :is_active
    
      #Определяем файлы для paperclip
  has_attached_file :img, :styles => { :medium => "100x100>", :thumb => "100x100#" },
      :url =>"/system/:class/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"
  
  before_save :basename
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
