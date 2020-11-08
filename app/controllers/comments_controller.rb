class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
        if params[:book_id] && @book = Book.find_by_id(params[:id])
            @comment = @book.comments.build
        else
            @error = "That book doesn't exist" if params[:book_id]
            @comment = Comment.new
        end
    end

    def show
    end

    def update
    end

    def create
        @comment = Comment.new(book_params)
        @comment.user = current_user
        if @comment.save
          redirect_to book_path(book_id), notice: "#{@comment.title} was created."
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
