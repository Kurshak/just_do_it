class Task < ApplicationRecord
    belongs_to :user
    validates :name, :description, presence: true
    
   #потому что опасный 
    def complit!      
       self.complited = true 
       save!
    end

    def fail!
            if self.time < (Time.zone.now) and self.complited == nil
                self.complited = false
                save!
            end
    end   


    def gre!
        if self.time > (Time.zone.now) and self.complited == false
            self.complited = nil
            save!
        end
    end


end




