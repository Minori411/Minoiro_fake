class InquiriesMailer < ApplicationMailer
  default from: ENV.fetch('DB_USERNAME', nil)   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: "pch.neurodive.yok005@gmail.com", subject: 'お問い合わせを承りました')
  end
end
