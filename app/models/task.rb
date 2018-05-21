class Task < ApplicationRecord
    belongs_to :user
    validates :name, :description, presence: true
   
   validate  :valid_time 
   #теперь не опасный //потому что опасный 
    def complit!      
       self.complited = true 
       save :validate => false
    end

   def time?
     self.time < Time.zone.now  
   end

    private
   
    def valid_time
      if self.time <= Time.zone.now
        errors.add(:time, "can not be less than the current")
      end
    end
end




