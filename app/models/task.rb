class Task < ApplicationRecord
    belongs_to :user
    belongs_to :task_list
    validates :name, :description, presence: true
    validate  :valid_time 
      STATUS =
      [
        ["today",0],
        ["tomorrow",1],
        ["later",2],
        ["time_is_gone",3]
      ]
    enum status: [:today, :tomorrow, :later, :time_is_gone,:complited]
   #теперь не опасный //потому что опасный //снова опасный
    def complit!      
      self.complited!
      self.time_complited = Time.zone.now
      save!
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




