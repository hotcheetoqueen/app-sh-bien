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
        @review = Review.new(form_params)

        #save to model
        if @review.save
            redirect_to root_path
        else
            render "new"
        end  

    end

    def show
        @review = Review.find(params[:id])
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        if @review.update(form_params)

        redirect_to review_path(@review)
        else
            render "edit"
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy

        redirect_to root_path
    end

    def form_params
        params.require(:review).permit(:title, :restaurant, :body, :score, :phone_number, :ambiance)
    end
    
end
