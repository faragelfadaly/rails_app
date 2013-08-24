class PostsController < ApplicationController
  
  http_basic_authenticate_with name: "farag", password: "2181989", except: [:index, :show]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post=Post.new    
  end
  
  def create
    # render text: params[:post].inspect
           
      @post = Post.new(params[:post])
      if @post.save # saving the model in the database , returns a boolean indicating whether the model was saved or not
        redirect_to @post  #redirect the user to the show action , tell the browser to issue another request
      else
        render 'new' # used so that the @post object is passed back to the new template when it is rendered
      end     
    
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
 
    if @post.update(params[:post])
      redirect_to @post
    else
    render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
   
    redirect_to posts_path
  end
  
  private
    def post_params #defined as private to prevent an attacker from setting the model's attributes by manipulating the hash passed to the model
      params.require(:post).permit(:title, :text)
    end
    
    
  
end
