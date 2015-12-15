class PagesController < ApplicationController

  before_filter :authenticate_user!, only: %i(my)

  def index
  end

  def my
  end
end
