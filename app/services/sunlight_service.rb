class SunlightService


  def self.legislators(attribute)
    response = conn.get "/legislators", attribute
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.conn
    Faraday.new(:url => 'https://congress.api.sunlightfoundation.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:apikey] = ENV['sunlight_api_key']
    end
  end
end


#original | response = Faraday.get("https://congress.api.sunlightfoundation.com/legislators?apikey=9479e7fd51934b139865d22b34444d44&state=CO")
#second factor | response = Faraday.get("https://congress.api.sunlightfoundation.com/legislators?apikey=#{ENV['sunlight_api_key']}&#{attribute.to_query}")
