require 'net/http'
require 'json'

module SnacksHelper
  SNACKS_URL = 'https://api-snacks.nerderylabs.com/v1/snacks?ApiKey=7a29a6d3-7d09-47d9-af3d-072ea9159080'

  #retrieve snacks that are always ordered
  def classic_snacks
    uri = URI(SNACKS_URL)
    @snacks = JSON.parse(Net::HTTP.get(uri))
  end
end
