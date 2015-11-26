require 'rack'

app = Proc.new do |env|
  num= rand(1..42)
  if num >= 20
    [200, {'Content-Type' =>'text/html'}, [num.to_s]] 
  else
    [404, {'Content-Type' =>'text/html'}, [num.to_s]]
  end
end

Rack::Handler::WEBrick.run app
