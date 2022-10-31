class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    if Article.exists?(params[:id])
      @article = Article.find(params[:id])
    else
      @articles = Article.all
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
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was create successfully"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "article was update successfully"
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to article_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end