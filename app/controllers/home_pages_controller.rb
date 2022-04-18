class HomePagesController < ApplicationController
  def index; end

  def new
    @home_page = HomePage.new
  end

  def create 
  end
end
