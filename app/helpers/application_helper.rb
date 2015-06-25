module ApplicationHelper
  def title
    base_title = "HariPrasanth Prasa Photography"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    logo = image_tag("logo.png", :alt => "HariPrasanth Prasa Photography")
  end
end
