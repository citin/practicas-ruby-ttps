# myapp.rb
require 'bundler'
Bundler.require
require 'rack'
require 'sinatra'
require_relative 'my_middleware'

use 'MyFirstMiddleware'

get '/sum/*' do
sum = 0
"#{params['splat'].first.chars.map{|c| c.to_i}.inject(:+)}"
end
