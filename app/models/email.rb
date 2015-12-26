class Email < ActiveRecord::Base
  after_create :check_account

  def check_account
    puts 'CHECKACCOUNT GO'
    to_email = self.to
    puts 'to_email: ' + to_email.to_s
    slug = to_email.split('@')[0]
    puts 'slug: ' + slug.to_s
    account = Account.where(slug: slug).first
    if account && !account.nil?
      self.account_id = account.id
      if !account.is_verified
        account.is_verified = true
        account.save
      end
      self.save
    end
    puts 'CHECKACCOUNT STOP'
  end
end
