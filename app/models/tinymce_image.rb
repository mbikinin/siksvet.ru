class TinymceImage < ActiveRecord::Base
  attr_accessible :file, :file_file_name
  has_attached_file :file, :styles => {:thumb => "80x80#"},
      :url =>"/images/:class/:style/:basename.:extension",
      :path => ":rails_root/public/images/:class/:style/:basename.:extension"
  before_save :basename
  
private
  def basename
    if self.file.dirty?
      new_filename = (Time.now + Random.new.rand(1..99)).to_i.to_s
      extension = File.extname(file_file_name).downcase
      self.file.instance_write :file_name, "#{new_filename}#{extension}"
      self.file_file_name = "#{new_filename}#{extension}"
    end
  end
end
