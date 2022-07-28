class InquiriesMailer < ApplicationMailer
  default from: ("whmd.030@gmail.com")   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: 'pch.neurodive.yok005@gmail.com')
  end
end
