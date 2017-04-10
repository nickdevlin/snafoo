class VotesController < ApplicationController

  def create
    @vote = Vote.new(snack_id: params["snack_id"].to_i)
    cookies[:vote_count] ||= 0
    if cookies[:vote_count].to_i >= 3 #determines whether vote count has been exceeded
      cookies[:vote_error] = "PLEASE READ ABOVE LINE MORE CLOSELY"
    #remaining cases determine the cookie in which the snack must be store
    elsif cookies[:vote2]
      @vote.save
      cookies[:vote3] = params["snack_id"]
      cookies[:vote_count] = cookies[:vote_count].to_i + 1
    elsif cookies[:vote1]
      @vote.save
      cookies[:vote2] = params["snack_id"]
      cookies[:vote_count] = cookies[:vote_count].to_i + 1
    else
      @vote.save
      cookies[:vote1] = params["snack_id"]
      cookies[:vote_count] = cookies[:vote_count].to_i + 1
    end
    p @vote_error
    redirect_to root_path
  end

end
