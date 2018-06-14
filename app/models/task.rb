class Task < ApplicationRecord
    belongs_to :user
    belongs_to :task_list
    validates :name, :description, presence: true
    validate  :valid_time 
      STATUS =
      [
        ["today"],
        ["tomorrow"],
        ["later"],
        ["time_is_gone"]
      ]
    enum status: [:time_is_gone,:today, :tomorrow, :later, :complited]
   #теперь не опасный //потому что опасный //снова опасный
    def complit!      
      update_attribute('status',"complited")
      update_attribute('time_complited',Time.zone.now)      
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




