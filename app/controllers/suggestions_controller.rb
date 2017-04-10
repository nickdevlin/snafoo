class SuggestionsController < ApplicationController
  include SnacksHelper

  def index
    retrieve_all_snacks
    @votes = Vote.all
  end

  def new
    retrieve_suggested_snacks
  end

  def create
    add_new_snack(params[:new_snack]["Name"], params[:new_snack]["Location"])
    redirect_to root_path
  end

end
