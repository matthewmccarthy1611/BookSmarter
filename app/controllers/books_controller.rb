class BooksController < ApplicationController
    before_action :authenticate_user!
    # helper_method :book_exist?

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @books = @user.books
            # binding.pry
        else
            flash[:alert] = "That user does not exist." if params[:user_id]
            @books = Book.all
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
        @book = Book.find_by_id(params[:id])
      end
    
      def update
        @book = Book.find_by_id(params[:id])
        @book.update(book_params)
        redirect_to book_path(@book)
      end
    
      def create
        @book = Book.new(book_params)
        if @book
            flash[:alert] = "Error: #{@book.title} already exists."
            render 'new'
        else
            if @book.save
                redirect_to books_path, notice: "#{@book.title} was created."
            else
                @error 
                render 'new'
            end
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
