class SunlightService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new "http://congress.api.sunlightfoundation.com"
    connection.query['apikey'] = 'ee45723941fd49a9a70da4cb5c634b1b'
    # lines 5-6 is accessing the api by hitting the server with the url below
    #http://congress.api.sunlightfoundation.com?apikey=ee45723941fd49a9a70da4cb5c634b1b
  end

  def legislators(zipcode)
    # congress.api.sunlightfoundation.com/legislators/locate?zip=80202&apikey=ee45723941fd49a9a70da4cb5c634b1b
    parse(connection.get("legislators/locate?zip=#{zipcode}"))[:results]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
