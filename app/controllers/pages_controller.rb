class PagesController < ApplicationController

  def home
    @micropost=Micropost.new if signed_in?
  end

  def about
  end

  def contact
  end

end
