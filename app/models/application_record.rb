class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  VALID_PHONE_REGEX = /([3|5|7|8|9])+([0-9]{8})\b/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end
