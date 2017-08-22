# sorcery------------------------------------------------------------
rails new gems -d mysql --skip-bundle #-d 指定数据库， --skip-bundle创建项目时候跳过bundle的命令

rails g sorcery:install -h #查看sorcery可以有哪些参数。

常用参数：remember_me 登出
          reset_password 重置密码
          user_activation 用户激活


config/initializers/sorcery.rb下面会有很多配置，如果注册后不需要发送邮件来激活需要配置的文件有3个

#当用户注册成功后，系统sorctory时候帮我们发送邮件。

#activation needed email method on your mailer class.
#Default: `:activation_needed_email`


user.user_activation_mailer = nil
user.activation_mailer_disabled = true #如果不需要发送邮件，就把左面的两句话设置为nil,和true;
user.user_activation_mailer = UserMailer #如果需要就会在自定义的类中找发送邮件的方法。比如在UserMailer中找
activation_needed_email 这个方法

user.prevent_non_active_users_to_login = false #(时候允许未激活的用户登录)如果没有开启用户激活功能，就需要把这里设置为false，否则用户
登录不上去


主要还得看官方文档
https://github.com/Sorcery/sorcery
# bootstrap和fontawesome----------------------------------------------------------------------
因为assetspapline机制是一个动态解析的文件需要把app/assets/stylesheets下面的application.css改为application.scss
通过关键字@import 引入bootstap和font-awesome
@import "bootstrap-sprockets";
@import "bootstrap";
@import "font-awesome";

再把bootstop对应的js引入进来 app/assets/javascripts/
//= require bootstrap-sprockets


https://bootswatch.com 这个网址或有各种各样的bootstrap
# sidekiq--------------------------------------------------------------------------------------
添加gem 'sidekiq'之后bundle

打开config/application.rb
添加 config.active_job.queue_adapter = :sidekiq #在rails4之后新添加的active_job组件（gem）针对主流异步任务的统一接口
打开app/jobs目录(这个目录也是rails4之后，新建目录会给我们自动创建)
可以把异步任务的类放到这个jobs目录下
*******
sidekiq 默认支持的就是redis数据库
redis默认是6379端口，那么sidekiq默认的就是链接本地的6379
web本身进程看作是一个客户端，客户端负责生成异步任务，这些任务被存到了redis当中
sidekiq作为服务端进程，来读取redis当中的异步任务，来负责运行这些异步任务的一些进程。

*******

UserNotification.set(wait: 5.minutes).perform_later("123") #五分钟之后执行。
UserNotification.perform_later("123") #立即执行。
