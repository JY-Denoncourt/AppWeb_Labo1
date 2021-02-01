class Api::CommentsController < ApiController
before_action :getArticle

#--Base--------------------------------------------------------------------  
    def index
       
        
        if @article
            render json: @article.comments
        else
            render json: @articles.errors
        end

    end


    def show
       
        comment = @article.comments.find(params[:id])

        if comment
            render json: comment
        else
            render json: comment.errors, status: not_found
        end
    end

#--New----------------------------------------------------------------

    def create
       
        comment = @article.comments.create(comment_params)
        
        if comment.save
            render json: comment.to_json
        else
            render json: comment.errors, status: :not_acceptable
        end
    end
   
#--Delete----------------------------------------------------------------

    def destroy
        
        comment = @article.comments.find(params[:id])

        if comment.destroy
            render json: comment.to_json
        else
            render json: comment.errors, status: not_found
        end

    end


#--Methode commune------------------------------------------------------


private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end

    def getArticle
        @article = Article.find(params[:article_id])
    end
end
