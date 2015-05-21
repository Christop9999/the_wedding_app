module ApplicationHelper
def wedding_document_link(wedding)
	 html = ""
	 if wedding.document && wedding.document.attachment? 
	 	html << content_tag(:span, "Attachment", class: "label label-info")
	 	html << link_to(wedding.document.attachment_file_name, wedding.document.attachment.url)       
      	 #image_tag @wedding.document.attachment.url(:medium) 
      	 return html.html_safe
    end 
end

def wedding_registration (path)
	if path.include?('register_wedding') 
    true 
	else 
    false 
	end 
end


def flash_class type
		case type
		when "alert"
			"alert-warning"
		when "notice"
			"alert-success"
		else
			""
	end
end

end
