class PagesController < ApplicationController
  def home
    @events = Event.all
  end

  def about
  end
end
