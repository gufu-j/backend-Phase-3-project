require 'pry'


class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  ## Running the server requires  " bundle exec rake server"
  ##Visiti Sinatra with Active Record: Get Request for more information.

  # Add your routes here
  #Bakeries
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json(include: :breads)
  end

  
  get "/bakeries/:id" do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :breads)
  end

  ##posting for bread
  post '/bakeries/:bakery_id/breads' do
    new_bread = Bread.create({
      name: params[:name],
      price: params[:price],
      bakery_id: params[:bakery_id],
      type_of_bread: params[:type_of_bread]
    })
    new_bread.to_json
  end
  ##posting for bakeries

  post '/bakeries' do
    new_bakery = Bakery.create({
      name: params[:name],
      location: params[:location],
    })
    new_bakery.to_json
  end

  delete '/bakeries/:id' do
    
    bakery = Bakery.find(params[:id])
    bakery.destroy
    bakery.to_json
    
  end

  patch '/bakeries/:id' do
    bakery = bakery.find(params[:id])
    bakery.update(
      name: params[:score],
      location: params[:comment]
    )
    bakery.to_json
  end





  #Breads
  get '/breads' do
    breads = Bread.all
    breads.to_json
  end

  post '/breads' do
    review = Bread.create(
      name: params[:name],
      price: params[:price],
      bakery_id: params[:bakery_id],
      type_of_bread: params[:type_of_bread]
    )
    review.to_json
  end

  

end





