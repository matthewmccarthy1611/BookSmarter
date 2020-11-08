class BooksController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @books = @user.books
        else
            flash[:alert] = "That user does not exist." if params[:user_id]
            @books = Book.all
        end
      end
    
      def new
      end
    
      def show
        @book = Book.find_by(id: params[:user_id])
      end
    
      def edit
      end
    
      def update
      end
    
      def create
        @book = Book.new(book_params)
        if @book.save
          redirect_to user_path(current_user), notice: "#{@book.title} was added to your library."
        else
          render 'new'
        end
      end
    
      def destroy
        @book.destroy
        redirect_to books_path, notice: "#{@book.title} was deleted."
      end
    
      private
    
      def book_params
        params.require(:book).permit(:title, :author, :description, :page_count, :user_id)
      end
end
