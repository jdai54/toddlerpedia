class WikisController < ApplicationController
  before_action :get_wiki, only: [:edit, :update, :destroy]

  def get_wiki
    @wiki = Wiki.find(params[:id])
  end

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @user = current_user
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.user = current_user
    @wiki.update_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Your wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error processing your wiki. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    @wiki.update_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "The wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error processing the update. Please try again."
      redirect_to :edit
    end
  end

  def destroy
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:now] = "There was an error trying to delete your wiki. Please try again."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
