class StaticPagesController < ApplicationController

  def index
    @randomcourse = Course.order("RANDOM()").first
  end

  def privacy
  end

  def team
  end 

  def careers
  end

end
