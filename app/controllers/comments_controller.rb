class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
            # binding.pry
            @comment = @book.comments.build
            # binding.pry
        else
            flash[:alert] = "That book doesn't exist" if params[:book_id]
            @comment = Comment.new
        end
    end

    def show
    end

    def update
    end

    def create
        @comment = current_user.comments.build(comment_params)
        # binding.pry
        if @comment.save
            flash[:alert] = "New comment was added!"
          redirect_to book_path(@comment.book)
        else
            @error 
          render :new
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
