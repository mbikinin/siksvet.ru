module RoomsHelper
  
  def current(id, current)
    return_class = ("#{id.to_s}" == current.to_s) ?  "current" : nil
    return return_class
  end
  
end
