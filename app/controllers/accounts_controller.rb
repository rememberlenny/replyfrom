class AccountsController < ApplicationController
  load_and_authorize_resource :user
  before_action :set_account, only: [:show, :update, :destroy]

  def new
    @account = Account.new()
  end

  def edit
  end

  def update_information
    @account = Account.find @current_user.current_account_id
    @account.update(account_params)
    redirect_to user_root
  end

  def new_information
    @account = Account.find @current_user.current_account_id
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = @current_user.id
    @account.save
    @current_user.current_account_id = @account.id
    @current_user.save
    redirect_to :new_information
  end

  def update
    @account.update(account_params)
    respond_with(@account)
  end

  def destroy
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:user_id, :slug, :fowarded_email, :description)
    end
end
