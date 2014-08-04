class MicropostsController < ApplicationController
  before_filter :authenticate
  def create
    @micropost=current_user.microposts.build(params[:micropost])
    @micropost.save
    flash[:success]="Micropost Created"
    redirect_to pages_home_path
  end

  def destroy
  end
end
