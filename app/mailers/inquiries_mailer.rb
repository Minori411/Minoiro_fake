class InquiriesMailer < ApplicationMailer
  default from: ENV['DB_USERNAME']   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => ENV['SEND_MAIL'], :subject => 'お問い合わせを承りました')
  end
end
