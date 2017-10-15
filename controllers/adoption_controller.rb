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
  @owner = Owner.all()
  erb(:"adoptions/new")
end

post '/adopted' do
  adoption = Adoption.new(params)
  adoption.save
  redirect to("/adopted")
end


post '/adopted/:id/delete' do
  adoption = Adoption.find(params['id'])
  adoption.delete
  adoption.update
  redirect to "/adopted"
end


# animal = Animal.find_by_id(params['id'])
# animal.change_status
# animal.update
