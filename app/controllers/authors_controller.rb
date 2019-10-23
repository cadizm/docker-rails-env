class AuthorsController < ApplicationController
  before_action :validate_update_params, only: :update

  def index
    @authors = Author
      .joins(:books)
      .order(:name)
      .page(params[:page])
      .per(params[:per_page])
  end

  def update
    author.update_attributes(update_params)
  end

  def destroy
    head :not_found unless author
    author.destroy
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

  private

  def author
    @author ||= Author.find_by(id: params.require(:id))
  end

  def update_params
    params.permit(:name)
  end

  def validate_update_params
    head :not_found unless author
    head :bad_request unless update_params.present?
  end
end
