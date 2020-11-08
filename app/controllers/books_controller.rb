class BooksController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @books = @user.books
            binding.pry
        else
            flash[:alert] = "That user does not exist." if params[:user_id]
            @books = Book.all
        end
      end
    
      def new
        @book = Book.new
      end
    
      def show
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @books = @user.books
        else
            flash[:alert] = "That user does not exist." if params[:user_id]
            @books = Book.all
        end
      end
    
      def edit
      end
    
      def update
      end
    
      def create
        @book = Book.new(book_params)
        binding.pry
        if @book.save
          redirect_to user_path(current_user), notice: "#{@book.title} was created."
        else
            @error 
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
