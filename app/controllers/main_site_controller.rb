class MainSiteController < ApplicationController
  def index
  end

  def my_courses
    @courses = Course.all
  end
end
