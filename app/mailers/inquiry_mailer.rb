class InquiryMailer < ApplicationMailer
    attr_accessor :name, :email, :phone_number, :title, :body

  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}

  default from: "whmd.030@gmail.com"   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => 'お問い合わせを承りました')
  end
end
