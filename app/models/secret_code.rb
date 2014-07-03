class SecretCode < ActiveRecord::Base
  attr_accessible :code
  belongs_to :user , {:foreign_key => "email"}
end
