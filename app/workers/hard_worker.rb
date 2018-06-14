class HardWorker
  include Sidekiq::Worker

  def perform(time,current_user,task)
    UserMailer.delay(time).time_false_email(current_user,task)
  end
end
