class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(aaa)
    @blog = aaa

    mail to: "111l000393@gmail.com",
    subject: "【Achieve】ブログが投稿されました "
  end

 def sendmail_contact(bbb)
    @contact = bbb

    mail to: @contact.email,
    subject: "【Achieve】お問い合わせが完了しました "
 end
end
