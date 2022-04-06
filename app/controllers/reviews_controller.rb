class ReviewsController < ApplicationController

    def index
        #list page for reviews

        @number = rand(100)

        @reviews = Review.all
    end

    def new
        @review = Review.new
    end

    def create
        #grab info from form
        @review = Review.new(params.require(:review).permit(:title, :body, :score))

        #save to database
        @review.save

        redirect_to root_path
    end

    def show
        @review = Review.find(params[:id])
    end

end
