json.users current_user.weddings do |wedding|
  json.name    current_user.wedding.name
  json.bride   current_user.wedding.bride

  
end