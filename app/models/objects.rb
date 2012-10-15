class Objects < ActiveRecord::Base
   attr_accessible :title, :description, :address, :phone, :date_finish, :longitude, :latitude,:img , :img_floor,
                    :img_file_name, :img_floor_file_name,
                    :is_active, :floors, :floors_int
  
  #Определяем файлы для paperclip
  has_attached_file :img, :styles => { :medium => "250x200#", :thumb => "150x150>" },
      :url =>"/system/:class/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"
  has_attached_file :img_floor, :styles => { :medium => "1000x600>", :thumb => "100x100>" },
      :url =>"/system/:class/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:id/:style/:basename_floor.:extension"
  before_save :basename
  before_save :basename_floor
  
  has_many :plans
  has_many :photos
  has_many :declarations
  has_many :rooms

private
  def basename
    if self.img.dirty?
      new_filename = Time.now.to_i.to_s
      extension = File.extname(img_file_name).downcase
      self.img.instance_write :file_name, "#{new_filename}#{extension}"
      self.img_file_name = "#{new_filename}#{extension}"
    end
  end
  def basename_floor
    if self.img_floor.dirty?
      new_filename = Time.now.to_i.to_s
      extension = File.extname(img_floor_file_name).downcase
      self.img_floor.instance_write :file_name, "#{new_filename}#{extension}"
      self.img_floor_file_name = "#{new_filename}_floor#{extension}"
    end
  end
end
