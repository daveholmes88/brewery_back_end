class BeersController < ApplicationController
    def create
        beer = Beer.create(name: Faker::Beer.name, brewery_id: params[:brewery_id])
        brewery = Brewery.find(beer[:brewery_id])
        render json: brewery, include: [:beers]
    end 

    def destroy
        beer = Beer.find(params[:id])
        brewery = Brewery.find(beer[:brewery_id])
        beer.destroy
        render json: brewery, include: [:beers]
    end 
end
