require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/owner'

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

post '/owners' do
  owner = Owner.new(params)
  owner.save
  redirect to("/adopted/new")
end

get '/blacklist' do
  @animals = Animal.available()
  erb(:"owners/blacklist")
end
