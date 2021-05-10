class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: { message: "success", fileID: @post.id  }, :status => 200
    else
      render json: { error: @post.errors.full_messages.join(',')}, :status => 400
    end
  end

private
  def post_params
    params.require(:posts).permit(:image).merge!(album_id: params[:album_id])
  end
end
