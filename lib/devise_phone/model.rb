module Devise
  module Models
  
    module Phonable
      extend ActiveSupport::Concern
                 
      included do   
        before_validation(:on => :create) do   
          self.phone = self.login
          self.email = self.phone + "@sms.tel" if self.email.blank?   
          self.password = "todo12" if self.password.blank? 
          self.password_confirmation = self.password if self.password_confirmation.blank? 
          self.phone_confirmation_token = "1111"               
        end               
      end       
      
      module ClassMethods
         def find_by_phone(phone_id)
            where("phone = '#{phone_id}'").first
         end   
         
         def confirm_by_token_phone(phone, confirmation_token)
           confirmable = find_or_initialize_with_errors([:phone, :phone_confirmation_token], {:phone => phone, :phone_confirmation_token => confirmation_token})
           confirmable.confirm_phone!  
           confirmable.confirm! if confirmable.persisted?
           confirmable
         end
      end
             
      def self.required_fields(klass)
        required_methods = [:phone, :phone_confirmation_token, :email, :password, :password_confirmation, :login]
        required_methods
      end                     
      
      def phone?  
        !!self.phone
      end
      
      def confirm_phone!
        self.phone_confirmation_token = nil
      end
            
    end
    
  end
end