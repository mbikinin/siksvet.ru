class Room < ActiveRecord::Base
  
  attr_accessible :title, :description, :count_rooms, :area_living_room, :area_kitchen, 
                  :area_room_1, :area_room_2, :area_room_3, :area_room_4, :area_wc_room, :area_bathroom_room,
                  :area_loggia, :description,
                  :img , :img_file_name, 
                  :is_active

  #Определяем файлы для paperclip
  has_attached_file :img, :styles => { :medium => "250x200#", :thumb => "100x100>" },
      :url =>"/system/:class/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"

  before_save :basename
  
  belongs_to :objects
  belongs_to :plan
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
