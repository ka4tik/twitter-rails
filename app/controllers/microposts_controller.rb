class MicropostsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user,:only=>:destroy
  def create
    @micropost=current_user.microposts.build(params[:micropost])
    @micropost.save
    flash[:success]="Micropost Created"
    redirect_to pages_home_path
  end

  def destroy
    @micropost.destroy
    flash[:success]="Micropost deleted"
    redirect_to pages_home_path
  end

  private

  def authorized_user
    @micropost=Micropost.find(params[:id])
    redirect_to root_path unless current_user?(@micropost.user)
  end
end
