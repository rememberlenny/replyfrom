class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :has_email_slug, except: :setup_account

  def show
    @emails = Email.where(account_id: @current_user.current_account_id).reverse
    @account = Account.find(@current_user.current_account_id)email
    @account_email = @account.email
  end

  def setup_account
    redirect_to :new_account
  end

  def setup_account_information

  end

  private

    def has_email_slug
      if Account.where(user_id: @current_user.id).empty?
        redirect_to :setup_account
      end
    end
end
