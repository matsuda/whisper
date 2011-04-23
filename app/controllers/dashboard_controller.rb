class DashboardController < ApplicationController
  def index
    @articles = Article.order('published_at DESC').limit(10)
  end
end
