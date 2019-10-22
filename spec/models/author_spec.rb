# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Author do
  let(:subject) { FactoryBot.create(:author) }

  it 'has a name' do
    expect(subject.name).not_to be_empty
  end

  context 'no books' do
    it 'has an empty book association' do
      expect(subject.books).to be_empty
    end
  end

  context 'some books' do
    let(:subject) { FactoryBot.create(:author_with_books, book_count: 7) }

    it 'has a non-empty book association' do
      expect(subject.books.size).to eql(7)
    end
  end
end
