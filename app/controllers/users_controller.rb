class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @prompts = Prompt.where(user_id: @current_user.id)
  end
end
