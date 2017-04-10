require 'net/http'

class SuggestionsController < ApplicationController
  include SnacksHelper

  def index
    retrieve_all_snacks
  end

  def new
    retrieve_suggested_snacks
  end

  def create
    new_snack_name = params[:new_snack]["Name"]
    new_snack_location = params[:new_snack]["Location"]
    add_new_snack(new_snack_name, new_snack_location)
    redirect_to root_path
  end

end
