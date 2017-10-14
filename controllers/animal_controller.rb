require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/animal'

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/available' do
  @animals = Animal.available()
  erb(:"animals/available")
end
