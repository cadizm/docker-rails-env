class AuthorsController < ApplicationController
  def index
    @authors = Author.page(params[:page]).per(params[:per_page]).order(:name)
  end
end
