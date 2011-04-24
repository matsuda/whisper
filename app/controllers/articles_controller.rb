class ArticlesController < ApplicationController
  before_filter :build_article, :only => %w(new create)
  before_filter :find_article, :only => %w(edit update)

  def index
    @articles = Article.published.page(params[:page])
  end

  def show
    @article = Article.find_by_slug(params[:slug])
  end

  def new
  end

  def create
    if @article.save
      # redirect_to article_path(@article.slug)
      redirect_to dashboard_path
    else
      render :new, :error => 'Invalid!'
    end
  end

  def edit
    render :new
  end

  def update
    @article.attributes = params[:article]
    if @article.save
      # redirect_to article_path(@article.slug)
      redirect_to dashboard_path
    else
      render :new, :error => 'Invalid!'
    end
  end

  private
  def build_article
    @article = Article.new(params[:article])
  end
  
  def find_article
    @article = Article.find_by_id(params[:id])
  end
end
