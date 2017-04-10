class VotesController < ApplicationController

  def create
    @vote = Vote.new(snack_id: params["snack_id"].to_i)
    session[:preferred_snacks] ||= []
    if session[:preferred_snacks].length >= 3 #determines whether voter can still vote based on number of votes cast
      cookies[:vote_error] = "Please refer to the top of the page." #throws error if not
    elsif session[:preferred_snacks].include? params["snack_id"]
      cookies[:vote_error] = "You already voted for that snack, dingus!" #throws error if snack has already been voted for
    else
      @vote.save
      cookies.delete(:vote_error) #resets error cookie for clean page
      session[:preferred_snacks] << params["snack_id"] #tracks snacks voted for
    end
    redirect_to root_path
  end

end
