class PagesController < ApplicationController

  before_filter :authenticate_user!, only: %i(my)

  def top
  end

  def my
  end

  def owner
    @rooms = current_user.rooms
  end

  def admin
  end
end
