class Account < ActiveRecord::Base
  after_create :generate_uid

  def self.check_is_unique_uid uid
    uu = Account.where(slug: uid)
    if uu.count == 0
      return true
    end
    return false
  end

  def self.start_verification_emails account_id
    account = Account.find account_id
    5.times do
      if(!account.is_receiving)
        VerifyForwardMailer.delay.verify_forward_email(account_id)
        sleep(30)
      end
    end
  end

  def self.create_uid
    generate_uid
  end

  def self.verify

  end

  def generate_uid
    uid = SecureRandom.hex(4)
    checked = Account.check_is_unique_uid(uid)
    if checked == true
      self.slug = uid
      self.save
    else
      generate_uid
    end
  end
end

