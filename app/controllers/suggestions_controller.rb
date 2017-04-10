class SuggestionsController < ApplicationController
  include SnacksHelper

  def index
    retrieve_all_snacks
    @votes = Vote.all
  end

  def new
    if cookies[:suggestion_made] #sends user to error page if a suggestion has already been made
      render :fourohfour
    else
      retrieve_suggested_snacks
    end
  end

  def create
    if check_for_duplicate(params[:new_snack]["Name"]) #checks for duplicate
      cookies[:suggestion_error] = "That's already been suggested. Come up with something more original."
      render :new
    else
      add_new_snack(params[:new_snack]["Name"], params[:new_snack]["Location"])
      cookies[:suggestion_made] = true
      redirect_to root_path
    end
  end

end
