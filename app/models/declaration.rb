class Declaration < ActiveRecord::Base
    attr_accessible :title, :anounce, :text, :img, :img_file_name, :is_active, :file, :objects_id
    
    has_attached_file :img, :styles => { :medium => "200x200#", :thumb => "150x150>" },
        :url =>"/images/:class/:id/:style/:basename.:extension",
        :path => ":rails_root/public/images/:class/:id/:style/:basename.:extension"
   
    before_save :basename
  belongs_to :objects
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
