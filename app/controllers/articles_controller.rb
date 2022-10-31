class ArticlesController < ApplicationController
  def show

    if Article.exists?(params[:id])
       @article = Article.find(params[:id])
    else
      @articles=Article.all
      render 'index'
    end
    # if @article==NIL
    #   render :new, status: :unprocessable_entity
    # end
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))

    if @article.save
      flash[:notice] = "Article was create successfully"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "article was update successfully"
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to article_path
  end
end