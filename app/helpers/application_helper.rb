module ApplicationHelper
  def title
    base_title = "Studio Nathan | Professional Candid Wedding Photography Services"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    logo = image_tag("logo.png", :alt => "Studio Nathan")
  end
end
