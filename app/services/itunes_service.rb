require 'net/http'
require 'json'

class ItunesService
  BASE_URL = 'https://itunes.apple.com'
  SEARCH_ENDPOINT = '/search'

  def self.search(term)
    url = "#{BASE_URL}#{SEARCH_ENDPOINT}?term=#{term}&attribute=albumTerm&entity=album"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)['results']
  rescue StandardError => e
    puts "Error: #{e.message}"
    []
  end
end