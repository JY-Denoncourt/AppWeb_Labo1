class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #http_basic_authenticate_with name: "etd", password: "shawi", except: [:index, :show]
  
#--Base--------------------------------------------------------------------  
  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end

#--New----------------------------------------------------------------

  def new
    @article = Article.new(picture: Picture.new)
    #@article.picture = Picture.new
  end

  def create
    @article = Article.new(article_params())
    

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

#--Update----------------------------------------------------------------

  def edit
    @article = Article.find(params[:id])
    
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

#--Delete----------------------------------------------------------------

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end


#--Methode commune------------------------------------------------------

  private
    def article_params
      return params
        .require(:article)
        .permit(:title, :body, :status, picture_attributes: [ :id, :name, :myPicture ])
    end


    
  end