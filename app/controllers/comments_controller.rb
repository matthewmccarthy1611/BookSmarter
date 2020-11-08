class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
        @comment = Comment.new
    end

    def show
    end

    def update
    end

    def create
        @comment = Comment.new(book_params)
        @comment.user = current_user
        if @book.save
          redirect_to books_path, notice: "#{@book.title} was created."
        else
            @error 
          render 'new'
        end
    end

    def destroy
        @comment.destroy
        redirect_to books_path, notice: "#{@comment.title} was deleted."
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :book_id)
    end
end
