class News < ActiveRecord::Base
   attr_accessible :title, :uri, :anounce, :text, :date, :is_active
   scope :active, where("is_active = 1")
end