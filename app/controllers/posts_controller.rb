class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :index  ]
  before_action :set_post, only: %i[edit update show]
  before_action :correct_user, only: [ :edit, :update ]

  def index
    @posts = Post.limit(10).order(id: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(posts_params)
    if post.save
      redirect_to posts_path, notice: "ポストを新規作成しました"
    else
      render new_post, alert: "ポストを作成出来ませんでした。"
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to posts_path, notice: "ポストを更新しました。"
    else
      render new_post, alert: "ポストを更新出来ませんでした。"
    end
  end

  def show
  end

  def destroy
    Post.find(params[:id]).destroy!
    redirect_to posts_path, notice: "ポストを削除しました。"
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def posts_params
      params.require(:post).permit(:content)
    end

    def correct_user
      user = User.find(@post.user_id)
      redirect_to posts_path, alert: "ポストの作成者のみ編集可能です" unless user == current_user
    end
end
