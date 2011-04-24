class DashboardController < ApplicationController
  before_filter :authentication_user!

  def index
    @articles = Article.page(params[:page])
  end
end
