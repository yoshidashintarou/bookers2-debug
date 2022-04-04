class BookCommentsController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:destroy]

   def create
    @book = Book.find(params[:book_id])
    @comment = BookCommt.new(book_comment_params)
    @commnt.user_id = current_user.id
    @comment.book_id = @book.id
    @comment.save
    redirect_back(fallback_location: root_path)
   end

   def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
   end

  private

  def book_comment_params
    params.require(:book).permit(:comment)
  end


end
