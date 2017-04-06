require 'net/http'

class VotesController < ApplicationController
  include SnacksHelper

  def show
    all_snacks
  end

end
