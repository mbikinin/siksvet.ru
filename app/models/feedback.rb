class Feedback < ActiveRecord::Base
  attr_accessible :name,:email,:phone,:text,:comment,:section
   validates_presence_of :name,:phone,:comment
end
