require 'sinatra'
require 'sinatra/contrib/all'

require_relative './models/animal.rb'
require_relative './models/owner.rb'


get '/' do
  @animals = Animal.all()
  erb(:index)
end

get '/adopted' do
  @owner = Owner.all()
  erb(:adopted)
end

get '/available' do
  @animals = Animal.available()
  erb(:available)
end

get '/owner/new' do
  @owner = Owner.all()
  erb(:new_owner)
end
