require 'csv'

class ImportAuthorsBooksJob < ApplicationJob
  def perform
    csv_file = Rails.root.join('db', 'seeds', 'good_reads_final.csv')
    options = {
      row_sep: :auto,
      headers: true,
      converters: [:numeric, -> (x) {x.strip}]
    }
    CSV.foreach(csv_file, options) do |row|
      author = Author.find_or_create_by(name: row['author_name'])
      Book.find_or_create_by(title: row['book_title'], author_id: author.id)
    end
  end
end
