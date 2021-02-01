class Api::ArticlesController < ApiController


#--Base--------------------------------------------------------------------  
    def index
      articles = Article.all
      
      render json: articles
    end


    def show
        article = Article.find(params[:id])
        
        render json: article.to_json(:include => :comments)
    end

#--New----------------------------------------------------------------

  def new
    article = Article.new(picture: Picture.new)
  
  end

  def create
    article = Article.new(article_params)
    
    if article.save
      render json: article.to_json
    else
      render json: article.errors, status: :not_acceptable
    end
  end

#--Update----------------------------------------------------------------

  def edit
    article = Article.find(params[:id])
    
  end

  def update
    article = Article.find(params[:id])

    if article.update(article_params)
        render json: article.to_json
      else
        render json: article.errors, status: :not_acceptable
    end
    
  end

#--Delete----------------------------------------------------------------

  def destroy
    article = Article.find(params[:id])
    
    if article.destroy
      render json: article
    else
      render json: comment.errors, status: not_found
    end
  end


#--Methode commune------------------------------------------------------

 private
    def article_params
      return params
        .require(:article)
        .permit(:title, :body, :status, picture_attributes: [ :id, :name])
    end


end
