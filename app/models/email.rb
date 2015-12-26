class Email < ActiveRecord::Base
  after_create :check_verified
  after_create :set_account

  def check_verified
    to_email = self.to
    slug = to_email.split('@')[0]
    account = Account.where(slug: slug).first
    if account && !account.nil?
      if !account.is_verified
        account.is_verified = true
        account.save
      end
    end
  end

  def set_account
    to_email = self.to
    slug = to_email.split('@')[0]
    account = Account.where(slug: slug).first
    if account && !account.nil?
      self.account_id = account.id
      self.save
    end
  end
end
