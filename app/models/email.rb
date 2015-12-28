class Email < ActiveRecord::Base
  after_create :check_verified
  after_create :set_account
  after_create :confirm_google_verification
  after_create :is_receiving

  def is_receiving
    to_email = self.to
    slug = to_email.split('@')[0]
    account = Account.where(slug: slug).first
    if !account.is_receiving && self.from != "forwarding-noreply@google.com"
      account.is_receiving = true
      account.save
    end
  end

  def confirm_google_verification
    to_email = self.to
    slug = to_email.split('@')[0]
    account = Account.where(slug: slug).first
    if self.from == "forwarding-noreply@google.com" && self.raw_text
      verification_code = self.raw_text.split("confirmation code\r\n")[1].split(' ')[0]
      account.verification_code = verification_code
      account.save
    end
  end

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

  def scan_full_html_for_email email_to_check
    emails = Email.where(from: email_to_check)
    emails.each do |ee|
      ht = ee.raw_html
      if !ht.nil?
        puts "success"
        found = ht.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)
        found.delete("scripts@plympton.com")
        found.delete("hackathon@plympton.com")
        found.delete("7ce06e61@incoming.replyfrom.com")
        ee.from = found.first
        ee.save
      else
        puts "nope"
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
