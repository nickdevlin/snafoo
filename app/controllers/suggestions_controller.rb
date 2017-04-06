require 'net/http'

class SuggestionsController < ApplicationController
  include SnacksHelper

  def show
    classic_snacks
  end

end
