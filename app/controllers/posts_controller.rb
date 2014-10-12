class PostsController < ApplicationController
	before_action :authenticate
	before_action :set_post, only: [:show, :edit, :update, :destroy]
  after_filter :set_previous_url, only: [:new]

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.feed
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        if request.original_url == new_post_url
          format.html { redirect_to session[:previous_url], notice: 'Post was created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { redirect_to :back }
          format.json { render :show, status: :created, location: @post }
        end
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
	  @post = current_user.posts.update(post_params)


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
      format.html { redirect_to :back }
      # format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = current_user.posts.find(params[:id])
  end

	def ensure_user_owns_post
		if @post.user != current_user
			redirect_to root_path, flash: {alert: "You tried to access a post that doesn't belong to you."}
		end
	end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:message, :location, :user_id)
  end

  def set_previous_url
    session[:previous_url] = URI(request.referer).path
  end
end
