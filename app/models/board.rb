class Board < ApplicationRecord
    belongs_to :user
    has_many :task_lists, dependent: :destroy
end
