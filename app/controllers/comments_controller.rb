class CommentsController < ApplicationController
    def index
      end
    
      def new
      end
    
      def show
      end

      def update
      end
    
      def create
      end
    
      def destroy
      end
    
      private
    
      def comment_params
        params.require(:comment).permit(:content, :book_id, :user_id)
      end
end
