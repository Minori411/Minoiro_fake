class InquiriesMailer < ApplicationMailer
  default from: ENV.fetch('GMAIL_USERNAME', nil)   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: 'pch.neurodive.yok005@gmail.com')
  end
end
