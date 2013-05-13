# coding: utf-8
#
class ContributionMailer < ActionMailer::Base
  default from: "Imagine <imagine@meurio.org.br>"
  layout 'mailer'

  def new_contribution contribution
    headers "X-SMTPAPI" => "{ \"category\": [\"imagine\", \"new_contribution\"] }"
    @contribution = contribution
    @user = contribution.idea.user
    mail(:to => @user.email, :subject => "Contribuíram para a sua ideia!")
  end

  def accept_contribution contribution
    headers "X-SMTPAPI" => "{ \"category\": [\"imagine\", \"accept_contribution\"] }"
    @contribution = contribution
    @user = contribution.user
    mail(:to => @user.email, :subject => "Aceitaram a sua contribuição!")
  end
end
