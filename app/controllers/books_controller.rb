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
        @book = Book.new
      end
    
      def show
        if @book = Book.find_by_id(params[:id])
            @book
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
        @book.assign_attributes(book_params)
        if @book.save
          flash[:alert] = "Book updated"
          redirect_to book_path(@book)
        else
          render :edit
        end
      end
    
      def create
        @book = Book.new(book_params)
        if @book.save
            flash[:alert] = "#{@book.title} was created."
            redirect_to book_path(@book)
        else
            render :new
        end
      end

      def destroy
        @book = Book.find_by_id(params[:id])
        @book.destroy
        redirect_to books_path, notice: "Book was deleted."
      end

      def with_comments
        @books = Book.all.with_comments
        render :index
      end
    
      private
    
      def book_params
        params.require(:book).permit(:title, :author, :description, :page_count, :user_id)
      end
end
