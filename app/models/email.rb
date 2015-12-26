class Email < ActiveRecord::Base
  after_create :check_account

  def check_account
    account = Account.where(slug: self.to.split('@')[0]).first
    if account && !account.empty?
      self.account_id = account.id
      self.save
    end
  end
end
