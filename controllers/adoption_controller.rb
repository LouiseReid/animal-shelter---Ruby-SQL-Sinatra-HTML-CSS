require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/owner'
require_relative '../models/animal'
require_relative '../models/adoption'

get '/adopted' do
  @adoptions = Adoption.all()
  erb ( :"adoptions/index" )
end

get '/adopted/new' do
  @animals = Animal.available()
  erb(:"adoptions/new")
end

post '/adopted' do
  adoption = Adoption.new(params)
  adoption.save
  redirect to("/adopted")
end
