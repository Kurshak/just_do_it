class Task < ApplicationRecord
    belongs_to :user
    validates :name, :description, :time, presence: true
   
    def complit!      
       self.complited = true 
       save!
    end

    def fail!
            if self.time < Time.now and self.complited == nil
                self.complited = false
                save!
            end
    end   

end

