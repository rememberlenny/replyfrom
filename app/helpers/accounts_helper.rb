module AccountsHelper

  def get_slug
    account = Account.find @current_user.current_account_id
    return account.slug
  end
end
