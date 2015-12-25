class PromptsController < ApplicationController
  load_and_authorize_resource :user
  before_action :set_prompt, only: [:show, :edit, :update, :destroy]

  def get_started

  end

  def index
    @prompts = Prompt.all
    respond_with(@prompts)
  end

  def show
    @emails = Email.where newsletter_id: @prompt.id
  end

  def new
    @prompt = Prompt.new
    respond_with(@prompt)
  end

  def edit
  end

  def create
    @prompt = Prompt.new(prompt_params)
    @prompt.user_id = @current_user.id
    @prompt.save
    respond_with(@prompt)
  end

  def update
    @prompt.update(prompt_params)
    respond_with(@prompt)
  end

  def destroy
    @prompt.destroy
    respond_with(@prompt)
  end

  private
    def set_prompt
      @prompt = Prompt.find(params[:id])
    end

    def prompt_params
      params.require(:prompt).permit(:name, :user_id, :description)
    end
end
