class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @prompts = Prompt.where()
  end
end
