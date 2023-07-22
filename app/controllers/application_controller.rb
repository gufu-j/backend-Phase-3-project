class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
 
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json(include: :breads)
  end

  post '/bakeries/:bakery_id/breads' do
    new_bread = Bread.create({
      name: params[:name],
      price: params[:price],
      bakery_id: params[:bakery_id],
      type_of_bread: params[:type_of_bread]
    })
    new_bread.to_json
  end

  post '/bakeries' do
    new_bakery = Bakery.create({
      name: params[:name],
      location: params[:location],
    })
    new_bakery.to_json(include: :breads)
  end

  delete '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.destroy
    bakery.to_json
    
  end

  patch '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.update(
      name: params[:name],
      location: params[:location]
    )
    bakery.to_json(include: :breads)
  end
  

  ## this below is practice
  # get '/breads/:type_of_bread' do
  #   breads = Bread.where(type_of_bread: params[:type_of_bread])
  #   breads.to_json
  # end

  get '/breads/:name' do
    breads = Bread.all.where(name: params[:name])
    breads.to_json
  end

  # what's below is not part of the curriculum, just continuity of project

  delete '/bakeries/:bakery_id/breads/:id' do
    bread = Bread.find(params[:id])
    bread.destroy
    bread.to_json
  end


end






