class Email < ActiveRecord::Base
  after_create :check_account

  def check_account
    account = Account.where(slug: self.to.split('@')[0]).first
    if account && !account.empty?

    end
  end
end
