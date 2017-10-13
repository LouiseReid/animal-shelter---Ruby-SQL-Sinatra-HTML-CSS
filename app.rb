require 'sinatra'
require 'sinatra/contrib/all'

require_relative './models/animal.rb'
require_relative './models/owner.rb'


get '/' do
  @animals = Animal.all()
  erb(:index)
end

get '/adopted' do
  @owner = Owner.animal()
  erb(:adopted)
end

get '/available' do
  @animals = Animal.available()
  erb(:available)
end
