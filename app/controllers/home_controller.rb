class HomeController < ApplicationController
  def index
    uri = URI.parse("http://api.openweathermap.org/data/2.5/forecast/city?q=bangalore,IN&APPID=3700a7e3d86bb9f7caa6b2ce98bacde2")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    stats = JSON.parse(response.body)
    @date = []
    @temp = []
    stats['list'].each do |s|
      @date << s['dt_txt'].to_date
      @temp << (s["main"]["temp"] / 10).round(2)
    end
  end
end
