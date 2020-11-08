class BooksController < ApplicationController
    def index
        @books = Book.all
      end
    
      def new
      end
    
      def show
        @book = Book.find_by(id: params[:id])
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
