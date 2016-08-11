class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:index, :show, :update, :destroy]

  

  def check_login  
    if !current_user  
     redirect_to new_user_session_path  
    end  
  end 

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if @post.fruitlist.present?
      @fruit_tag = @post.fruitlist.split(',')
    end

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
    
    @post = Post.new(post_params)
    month = @post.eat_time.day
    day = @post.eat_time.month
    year = @post.eat_time.year
    # binding.pry
    date_arr = []
    date_arr << year << month << day 
    @post.eat_time = DateTime.parse(date_arr.join('-'))
    @post.save


    # binding.pry
    ap @post
    
    if params[:userfruits].present?
      fruitlist = params[:userfruits].join(",")
      @post.fruitlist = fruitlist
      @post.save
    end
    
    respond_to do |format| 
      if @post.save
        
        current_user.posts << @post
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        # binding.pry
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content,:photo,:eat_time)
    end
end
