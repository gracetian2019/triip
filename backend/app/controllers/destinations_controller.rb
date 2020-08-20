class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all

        render json: @destinations, status: 200
    end

    def random_destination
        @destinations = Destination.all
        randomNum = rand(@destinations.length)

     render json: @destinations[randomNum], status: 200
    end
end
