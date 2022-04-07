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

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(params.require(:review).permit(:title, :body, :score))

        redirect_to review_path(@review)
    end
        

    def destroy
        @review = Review.find(params[:id])
        @review.destroy

        redirect_to root_path
    end
    
end
