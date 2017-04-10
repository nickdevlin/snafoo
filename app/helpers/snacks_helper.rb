require 'rest-client'
require 'json'

module SnacksHelper
  SNACKS_URL = 'https://api-snacks.nerderylabs.com/v1/snacks?ApiKey=7a29a6d3-7d09-47d9-af3d-072ea9159080'

  #parse that feed into something we can use
  def parse_all_snacks
    JSON.parse(RestClient.get SNACKS_URL)
  end

  #filter out snacks that are always ordered
  def retrieve_classic_snacks
    @classic_snacks = parse_all_snacks.select { |snack| snack["optional"] == false }
  end

  #filter snacks under consideration
  def retrieve_suggested_snacks
    @suggested_snacks = parse_all_snacks.select { |snack| snack["optional"] == true }
  end

  #combine methods into one for use in suggestions controller
  def retrieve_all_snacks
    retrieve_suggested_snacks
    retrieve_classic_snacks
  end

  #add new snack to data feed
  def add_new_snack(snack_name, snack_location)
    new_snack = RestClient.post SNACKS_URL, {name: snack_name, location: snack_location}.to_json, content_type: :json
    added_snack = JSON.parse(new_snack)
  end






end
