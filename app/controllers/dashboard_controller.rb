class DashboardController < ApplicationController
  def index
    @articles = Article.page(params[:page])
  end
end
