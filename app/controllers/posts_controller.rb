class PostsController < ApplicationController
  before_action :authenticate
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, only: [:new]

  # GET /posts
  # GET /posts.json
  # def index
  #   @posts = current_user.posts
  # end
  def index
    @posts = Post.order("published_date DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/1
  # GET /posts/1.json
  # def show
  # end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    # if current_user
    #   @post.update(post_params)
    # else
    #   redirect_to post_path, flash: {alert: "Sorry, you can't edit other users' posts."}
    # end
  end

  # POST /posts
  # POST /posts.json
  def create
    if current_user
      @post = current_user.posts.build(post_params)
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def ensure_user_owns_post
    if @post.user != current_user
      render nothing: true, status: :not_found
      redirect_to root_path, flash: {alert: "You tried to access an entry that doesn't belong to you."}
    end
  end

  def ensure_logged_in
    if current_user == nil
      redirect_to root_path, flash: {alert: "You must log in to make a post."}
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body,:published_date)
  end
end
