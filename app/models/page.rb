class Page < ActiveRecord::Base
  attr_accessible :title, :description, :text, :is_active , :on_menu, :uri
end
