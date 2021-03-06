require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/animal'

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/animals/new' do
  @animals = Animal.all()
  erb(:"animals/new")
end

post '/animals' do
  @animal = Animal.new(params)

  filename = params[:picture][:filename]
  file = params[:picture][:tempfile]

  File.open("./public/#{filename}", 'wb') do |f|
    f.write(file.read)
  end

  @animal.picture = filename
  @animal.save()
  redirect to ("/animals")
end


get '/animals/find' do
  @animals = Animal.find_by_type(params['type'])
  erb(:"animals/type")
end

post '/animals/find' do
  @animals = Animals.find_by_type(params['type'])
  erb(:"animals/type")
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
  @animal = Animal.new(params)
  @animal.update
  redirect to "/animals"
end

post '/animals/:id/delete' do
  animal = Animal.find_by_id(params['id'])
  animal.delete
  redirect to "/animals"
end

get '/animals/:id/info' do
  @animal = Animal.find_by_id(params['id'])
  erb(:"animals/info")
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

post '/animals/:id/delete' do
  Animal.delete(params['id'])
  redirect to ("/animals")
end
