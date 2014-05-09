module ApplicationHelper
  #helper function that will hide a section if the condition is true.
  # used for hidding the consider pets section on the main page if it is empty
  def hidden_div_if (condition, attributes= {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

end
