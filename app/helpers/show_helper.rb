module ShowHelper
	def show_user_bg
		if @wedding.content.blank?
			"background-image: url(#{asset_path('BG1.jpg')});"
		else
			"background-image: url(#{@wedding.content.header.url});"
		end
	end

end