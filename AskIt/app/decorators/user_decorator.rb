class UserDecorator < ApplicationDecorator
  delegate_all
  
  def name_or_email 
    # if.name.present? 
    #  name 
    # else
    #   email.split('@')[0] 
    # end  
    return name if name.present?
    
    email.split('@')[0] 
  end
end
