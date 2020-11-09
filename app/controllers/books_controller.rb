class BooksController < ApplicationController
    before_action :authenticate_user!
    # helper_method :book_exist?

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @books = @user.books
            # binding.pry
        else
            flash[:alert] = "That user does not exist." if params[:user_id]
            @books = Book.all.alpha
        end
      end
    
      def new
        @book = Book.new
      end
    
      def show
        if @book = Book.find_by_id(params[:id])
            @book
            # binding.pry
        else
            flash[:alert] = "Book does not exist"
            redirect_to books_path
        end
      end
    
      def edit
      end
    
      def update
      end
    
      def create
        @book = Book.new(book_params)
        # binding.pry
        if @book.save
            flash[:alert] = "#{@book.title} was created."
            redirect_to books_path
        else
            render :new
        end
      end

      def destroy
        @book = Book.find_by_id(params[:id])
        @book.destroy
        redirect_to books_path, notice: "Book was deleted."
        end
    
      private
    
      def book_params
        params.require(:book).permit(:title, :author, :description, :page_count, :user_id)
      end
end
