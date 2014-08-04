class PagesController < ApplicationController

  def home
    @micropost=Micropost.new if signed_in?
    if signed_in?
      @feed_items=current_user.feed.paginate(:page => params[:page])
    end
  end

  def about
  end

  def contact
  end

end
