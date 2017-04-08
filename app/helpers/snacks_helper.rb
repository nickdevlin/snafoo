require 'rest-client'
require 'json'

module SnacksHelper
  SNACKS_URL = 'https://api-snacks.nerderylabs.com/v1/snacks?ApiKey=7a29a6d3-7d09-47d9-af3d-072ea9159080'

  #retrieve snacks that are always ordered
  def classic_snacks
    all_snacks = RestClient.get SNACKS_URL
    @snacks = JSON.parse(all_snacks)
  end

  #add new snack to data feed
  def add_new_snack(snack_name, snack_location)
    new_snack = RestClient.post SNACKS_URL, {name: snack_name, location: snack_location}.to_json, content_type: :json
    added_snack = JSON.parse(new_snack)
  end
end
