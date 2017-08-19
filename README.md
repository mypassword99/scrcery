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
