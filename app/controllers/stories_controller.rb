class StoriesController < ApplicationController

  respond_to :html

  def index

    respond_with @story = Story.first
  end

end
