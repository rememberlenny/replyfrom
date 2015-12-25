class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :has_email_slug, except: :setup_account

  def show
    @prompts = Prompt.where(user_id: @current_user.id)
  end

  def setup_account

  end

  private

    def has_email_slug
      if Account.where(user_id: @current_user.id).empty?
        redirect_to :setup_account
      end
    end
end
