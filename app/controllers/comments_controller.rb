class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])

    comment = article.comments.build(comment_params)

    if comment.save
      redirect_to article
    else
      render 'article/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to comment.article
  end

  def edit
    @comment = Comment.find(params[:id])

    @article = @comment.article
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(comment_params)
      redirect_to comment.article
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
