class Story < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'
  belongs_to :requester, :class_name => 'User'

end
