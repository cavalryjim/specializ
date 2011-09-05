module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Specializ"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("specializ.png", :alt => "Specializ", :class => "round")
  end
  
  def accordion(titles, expanders, options = {})
   js = %Q(window.onload = function() {
    var titles =
     document.getElementsByClassName('#{titles}');
    var expanders =
     document.getElementsByClassName('#{expanders}');
    var myEffect =
     new Fx.Accordion(titles, expanders,
       #{options_for_javascript(options)});
   };)
   javascript_tag(js.chop!)
  end
  
end
