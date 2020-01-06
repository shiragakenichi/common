class Profile < ApplicationRecord
  belongs_to :user 

  # def age
  #   date = Date.today
  #   dates = '#{'date.year'}' + '#{'data.month'}' + '#{'date.day'}'
  # end
  
end
