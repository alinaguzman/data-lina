require 'httparty'

class Foursquare
  include HTTParty

  base_uri('https://api.foursquare.com/v2')

  def initialize(options={})
    oauth_token = options[:oauth_token]
    v = options[:v]
    @options = { query: { oauth_token: oauth_token, v: v } }

  end

  def checkins
    response ||= self.class.get('/users/self/checkins', @options)
    @checkins = response['response']['checkins']['items'].map do |json|
      SwarmCheckin.new(json)
     end
  end

end
