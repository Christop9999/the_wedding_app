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

def BG_img
image_tag current_user.wedding.document.attachment.url
end


def wedding_venue
	if current_user.wedding.venues.first
		current_user.wedding.venues.first
	else
		false
	end

end

def venue_name
current_user.wedding.venues.first.name
end


def venue_address_street
 current_user.wedding.venues.first.street
end

def venue_address_city
 current_user.wedding.venues.first.city
end

def venue_address_zip
 current_user.wedding.venues.first.zip
end

def venue_url
 current_user.wedding.venues.first.url
end


def venue_name
current_user.wedding.venues.first.name
end

def venue_description
current_user.wedding.venues.first.description
end

def venue_address_state
current_user.wedding.venues.first.state
	end







end
