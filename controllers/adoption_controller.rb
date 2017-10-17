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
  @owner = Owner.cleared()
  erb(:"adoptions/new")
end

post '/adopted' do
  adoption = Adoption.new(params)
  adoption.save
  animal = Animal.find_by_id(params['animal_id'])
  animal.change_status
  animal.update
  redirect to("/adopted")
end


post '/adopted/:id/delete' do
  adoption = Adoption.find(params['id'])
  adoption.animal.delete
  adoption.owner.delete
  adoption.delete
  redirect to "/adopted"
end

post '/adopted/:id/cancel' do
  adoption = Adoption.find(params['id'])
  adoption.animal.change_status
  adoption.animal.update
  adoption.owner.change_status
  adoption.owner.update
  adoption.delete
  redirect to "/blacklist"
end
