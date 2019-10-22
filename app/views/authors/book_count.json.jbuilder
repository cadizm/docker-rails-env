json.authors @authors do |author|
  json.id author.id
  json.name author.name
  json.partial! 'books', books: author.books
end

json.page params[:page] || 1
json.total @authors.total_count
json.per_page params[:per_page] || Kaminari.config.default_per_page
