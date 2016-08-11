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
      @heat = 0.0
      @water= 0.0
      @protein= 0.0
      @fat= 0.0
      @carbohydrate= 0.0
      @fiber= 0.0
      @sugar= 0.0
      @na = 0.0
      @k= 0.0
      @ca= 0.0
      @mg= 0.0
      @fe= 0.0
      @zn= 0.0
      @p= 0.0
      @va= 0.0
      @ve= 0.0
      @vb= 0.0
      @vc= 0.0
      @fruit_tag.each do |fu|
        f = Fruit.find_by_name(fu)
        @heat += f.heat
        @water+= f.water
        @protein+=  f.protein
        @fat+= f.fat
        @carbohydrate+= f.carbohydrate
        @fiber+=  f.fiber
        @sugar+=  f.sugar
        @na +=  f.na
        @k+=  f.k
        @ca+=  f.ca 
        @mg+=  f.mg   
        @fe+=  f.fe
        @zn+=  f.zn
        @p+=   f.p
        @va+=  f.va
        @ve+=  f.ve
        @vb+=  f.vb
        @vc+=  f.vc
      end
      binding.pry
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
    if post_params[:eat_time].present?
      
      date_arr = post_params[:eat_time].split("/")
      arr =[] 
      arr << date_arr[2] << date_arr[0] << date_arr[1] 
      @post.eat_time = DateTime.parse(arr.join('-'))
      @post.save
    end


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
