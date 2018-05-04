class Task < ApplicationRecord
    belongs_to :user
    validates :name, :description, :time, presence: true
   
end

