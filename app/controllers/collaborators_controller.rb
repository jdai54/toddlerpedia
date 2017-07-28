class CollaboratorsController < ApplicationController

  def index
    @collaborators = policy_scope(Collaborator)
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:collaborator][:user])

    if User.exists?(@user)
     @collaborator = @wiki.collaborators.new(user_id: @user.id, wiki_id: @wiki.id)
      if @collaborator.save
        flash[:notice] = "#{@user.email} saved as a collaborator."
        redirect_to @wiki
      else
        flash.now[:alert] = "There was an error saving your collaborator, please try again."
      end
    else
      flash[:alert] = "That user does not have a Toddlerpedia Account."
    end
  end

  def destroy
    @collaborator  = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki

    if @collaborator.destroy
      flash[:notice] = "The collaborator was removed successfully."
      redirect_to :back
    else
      flash.now[:alert] = "There was an error deleting the collaborators."
      render :show
    end
  end
end
