class StoriesController < ApplicationController

  respond_to :html

  def index
    respond_with @greetings_person = 'IVAN EFREMOV'
  end

end
