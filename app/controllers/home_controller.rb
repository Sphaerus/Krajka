class HomeController < ApplicationController
  
  def index
    @magazines = Magazine.latest
  end
end