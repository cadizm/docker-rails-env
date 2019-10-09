# == Schema Information
#
# Table name: books
#
#  id           :bigint           not null, primary key
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#

class Book < ApplicationRecord
  belongs_to :author
end
