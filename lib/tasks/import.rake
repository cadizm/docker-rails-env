namespace :import do
  desc 'Import Author/Book Seed Data'
  task authors_books: :environment do
    ImportAuthorsBooksJob.new.perform
  end
end
