class AuthorsController < ApplicationController
  def index
    @authors = Author
      .joins(:books)
      .order(:name)
      .page(params[:page])
      .per(params[:per_page])
  end

  def update
  end

  def book_count
    min = params.fetch(:min, 1)
    @authors = Author
      .joins(:books)
      .where(id: Book.group(:author_id)
        .having("count(author_id) >= #{min}")
        .pluck(:author_id))
      .distinct
      .page(params[:page])
      .per(params[:per_page])
  end
end
