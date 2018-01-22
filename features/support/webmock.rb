require 'webmock/cucumber'
WebMock.disable_net_connect!(allow_localhost: true)

Before ('@gmap') do
  fixtures_path = "#{::Rails.root}/spec/fixtures"

  stockholm_1 = File.open("#{fixtures_path}/stockholm_1").read
  stockholm_2 = File.open("#{fixtures_path}/stockholm_2").read
  stockholm_3 = File.open("#{fixtures_path}/stockholm_3").read

  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Kungsgatan%2025,11156,Stockholm&key=AIzaSyCHgPt-pc3Mt8xSRhj94gV6Ge1X9zJpvzg&language=en&sensor=false").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: stockholm_1, headers: {})

  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Kungsgatan%2025,%20111%2056%20Stockholm,%20Sweden&key=AIzaSyCHgPt-pc3Mt8xSRhj94gV6Ge1X9zJpvzg&language=en&sensor=false").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: stockholm_1, headers: {})

  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Hamngatan%201,11147,Stockholm&key=AIzaSyCHgPt-pc3Mt8xSRhj94gV6Ge1X9zJpvzg&language=en&sensor=false").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: stockholm_2, headers: {})

  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Hamngatan%201,%20111%2047%20Stockholm,%20Sweden&key=AIzaSyCHgPt-pc3Mt8xSRhj94gV6Ge1X9zJpvzg&language=en&sensor=false").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: stockholm_2, headers: {})

  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Hantverksgatan%2028,11221,Stockholm&key=AIzaSyCHgPt-pc3Mt8xSRhj94gV6Ge1X9zJpvzg&language=en&sensor=false").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: stockholm_3, headers: {})

  stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=Hantverkargatan%2028,%20112%2021%20Stockholm,%20Sweden&key=AIzaSyCHgPt-pc3Mt8xSRhj94gV6Ge1X9zJpvzg&language=en&sensor=false").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: stockholm_3, headers: {})
end
