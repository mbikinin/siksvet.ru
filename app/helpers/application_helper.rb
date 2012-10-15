module ApplicationHelper
  def current(id, current)
    return_class = ("#{id}" == current) ?  "current" : nil
  end
  
end
