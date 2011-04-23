module ApplicationHelper
  include BlogHelper

  def render_content(text, template = :erb)
    if template == :erb
      text
    else
      self.__send__(template, text)
    end
  end

  def markdown(text)
    RDiscount.new(text).to_html.html_safe
  end

  # http://emersonlackey.com/article/rails3-error-messages-for-replacement
  # http://ariejan.net/2010/12/15/why-did-errormessagesfor-disappear-from-rails-3/
  def errors_for(object, message = nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{object.class.name.humanize.downcase}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{object.class.name.humanize.downcase}</h5>\n"
        end    
      else
        html << "<h5>#{message}</h5>"
      end  
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end
end
