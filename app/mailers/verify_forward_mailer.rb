class VerifyForwardMailer < ActionMailer::Base
  default from: Rails.application.config.settings.mail.from
  layout 'emails/verify_forward'

  def verify_forward_email(account)
    return false unless load_user(account).present?
    if !@account.is_receiving
      mail to: @account.fowarded_email, subject: I18n.t('emails.verify_forward.subject')
    end
  end

  protected

  def load_user(account)
    @account = account.is_a?(User) ? account : Account.find(account)
    @user = User.find @account.user_id
    @user_email = @user.email
  end
end
