class SearchController < ApplicationController
  def perform
    @query = params[:query]
    @search_type = params[:search_type]

    case @search_type
    when 'cafes'
      @cafes = Cafe.where('name LIKE ?', "%#{@query}%").page(params[:page]).per(10)
      render 'cafes/index'
    when 'users'
      @users = User.where('name LIKE ?', "%#{@query}%").page(params[:page]).per(10)
      render 'users/index'
    else
      redirect_to root_path, alert: 'Invalid search type'
    end
  end
end
