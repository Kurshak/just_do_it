class UserMailer < ApplicationMailer

    default from: 'j-doit@inbox.ru'
    layout 'mailer'


    def time_false_email(current_user,task)
        @task=task
        @user = current_user.email
        mail(to: @user, subject: 'your task will be overdue time')
       #debugger
      end
end
