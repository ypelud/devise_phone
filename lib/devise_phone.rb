module DevisePhone
  
end


require 'devise'
require 'devise_phone/routes'
require 'devise_phone/rails'

module Devise
 
end

Devise.add_module :phonable, :controller => :confirmaphones, :model => 'devise_phone/model', :route => :phone

     