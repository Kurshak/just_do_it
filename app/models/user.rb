class User < ApplicationRecord
    has_many :task
   has_secure_password
end
