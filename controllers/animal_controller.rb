require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/animal'

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/animals/:id' do
  @animal = Animal.find_by_id(params['id'])
  erb(:"animals/edit")
end


get '/animals/:id/edit' do
  @animal = Animal.find_by_id(params['id'])
  erb(:"animals/edit")
end

post '/animals/:id/edit' do
  @animal = Animal.new(params['id'])
  @animal.update
  redirect to "/animals"
end

post '/animals/:id/delete' do
  animal = Animal.find_by_id(params['id'])
  animal.delete
  redirect to "/animals"
end


get '/available' do
  @animals = Animal.available()
  erb(:"animals/available")
end

post '/available/new' do
  animal = Animal.new(params)
  animal.save()
  redirect to("/available")
end
