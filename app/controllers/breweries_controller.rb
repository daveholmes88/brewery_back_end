class BreweriesController < ApplicationController
    
    def index
        breweries = Brewery.all
        render json: breweries
    end 

    def create
        brewery = Brewery.create(brewery_params)
        render json: brewery, include: [:beers]
    end 

    def show 
        brewery = Brewery.find(params[:id])
        render json: brewery, include: [:beers]
    end 

end

private

def brewery_params
    params.require(:brewery).permit(:name, :kind, :address, :city, :state, :website)
end 