class ReviewsController < ApplicationController

    def index
        #list page for reviews

        @number = rand(100)

        @reviews = [
            "The Smile",
            "Katz Deli",
            "Baby Bo's",
            "Peter Pan Donuts"
        ]
    end

    def new
        
    end

end
