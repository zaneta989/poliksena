class CommentsController < ApplicationController
  load_and_authorize_resource :only => [:create, :destroy]

  

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.commenter = current_user.username #or whatever is you session name
    authorize! :create, @comment
    if @comment.save
      redirect_to article_path(@article)
    else
      flash.now[:danger] = "error"
    end


  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end


  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
