class PagesController < ApplicationController
  def home
    @events = Event.all
  end

  def about; end

  def terms; end

end
