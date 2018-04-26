class Task < ApplicationRecord

    validates :name, :description, :time, presence: true



end
