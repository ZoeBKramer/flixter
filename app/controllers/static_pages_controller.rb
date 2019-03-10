class StaticPagesController < ApplicationController

  def index
    @randomcourse = Course.order("RANDOM()").first
  end

end
