class UserNotification < ApplicationJob

  #定义队列，下面这句话就是default队列
  queue_as :default

  rescue_from(ActiveRecord::ConnectionTimeoutError) do
    retry_job wait: 5.minutes
  end
  rescue_from(ActiveRecord::RecordNotFound) do
    # do nothing
  end

  #参数，只能传递简单的数据类型。因为这个参数是存到的redis中
  def perform(notifications)
    User.find_each do |user|
      # send notification to user
    end
  end

end
