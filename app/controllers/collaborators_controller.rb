class CollaboratorsController < ApplicationController

  def new
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user.User.where(email: params[:user])
    collaborator = @wiki.collaborators.build(user_id: @user.id)

    if collaborator.save
      flash[:notice] = "#{:user} saved as a collaborator."
    else
      flash.now[:alert] = "There was an error saving your collaborator, please try again."
    end

    redirect_to wiki
  end

  def destroy
    @collaborator  = Collaborator.find(param[:id])
    @wiki = @collaborator.wiki

    if collaborator.destroy
      flash[:notice] = "#{:user} was removed successfully."
      redirect_to :back
    else
      flash.now[:alert] = "There was an error deleting the collaborators."
      render :show
    end
  end
end
