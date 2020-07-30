class CommentService
  def initialize(comment)
    @comment = comment
  end

  def update
    redirect
    if equal_with_current_user?(@comment.user)
      if @comment.update(comment_params)
        redirect_to @article
      else
        render :edit
      end
    else
      flash[:danger] = 'Wrong User'
      redirect_to(root_path) and return
    end
  end

  def redirect
    return redirect_to(root_path) unless equal_with_current_user?(@comment.user)

    return redirect_to(@comment) if comment_update
  end

  def comment_update
    @comment.update(comment_params)
  end
end
