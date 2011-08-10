module ApplicationHelper
  def title(title)
    content_for(:title){ title }
  end

  def full_title(title)
    content_for(:full_title){ title }
  end

  def page_title
    if content_for(:full_title).present?
      content_for(:full_title)
    elsif content_for(:title).present?
      "RubyonBr Forum - #{content_for(:title)}"
    else
      "RubyonBr Forum"
    end
  end
  
  def meta_description(description)
    content_for(:meta_description){ description }
  end
end