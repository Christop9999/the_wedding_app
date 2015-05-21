json.weddings @weddings do |wedding|
 

  if current_user.id == 2
  	json.user wedding.user_id
  end


  
end