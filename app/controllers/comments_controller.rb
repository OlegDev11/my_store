class CommentsController < ApplicationController
  def create                                             #функционал для коментариев
      @item = Item.find(params[:item_id])
      @comment = @item.comments.create(comment_params)
      redirect_to item_path(@item)
    end

     private def comment_params
      params.require(:comment).permit(:body)
    end
end
