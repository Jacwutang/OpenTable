class Api::RestaurantsController < ApplicationController
  def index
    p params, "HERE WE ARE"
    p params[:region]

    @restaurants = Restaurant.all
    render "api/restaurants/index"
  end

  def show
    @rest = Restaurant.find(params[:id])

    render "api/restaurants/show"
  end

  def create

    @rest = Restaurant.new(rest_params)
    if @rest.save
      # print ("hello world")
      # print(@rest.id)
      # print( @rest)

      render "api/restaurants/show"


    else

      render json: @rest.errors.full_messages, status: 422
    end

  end

  def edit
    @rest = Restaurant.find(params[:id])
    render "api/restaurants/show"
  end

  def update
    @rest = Restaurant.find(params[:id])


    if @rest.update(rest_params)
      render "api/restaurants/show"
    end

  end

  def destroy

    rest = Restaurant.find(params[:id])
    @rest = rest

    if rest.destroy
      # @restaurant.owner_id = nil
      # @restaurant.save
      render "api/restaurants/show"
    else
      render json: ['Invalid'], status: 404
    end

  end

  private
  def rest_params
    params.require(:restaurant).permit(:name,:address,:city,:state,:postal_code,:country,:price,:category,:price,:thumbnail,:image_urls,:owner_id,:max_reservations,:lng,:lat, :description)
  end

end
