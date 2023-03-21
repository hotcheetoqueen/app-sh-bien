class BookmarksController < ApplicationController
    before_action :check_login

    def show
        @review = Review.find(params[:review_id])
        @bookmark = @review.bookmarks.where(user: @current_user)
    end
    
    def create
        @review = Review.find(params[:review_id])

        @bookmark = @review.bookmarks.new
        @bookmark.user = @current_user

        @bookmark.save

        redirect_to review_path(@review)
    end

    def destroy
        @review = Review.find(params[:review_id])

        @review.bookmarks.where(user: @current_user).delete_all

        redirect_to review_path(@review)
    end

end
