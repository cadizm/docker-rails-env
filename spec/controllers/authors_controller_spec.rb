require 'rails_helper'

describe AuthorsController, type: :controller do
  describe '#update' do
    let(:author) { FactoryBot.create(:author, name: 'Original Dude') }

    it 'returns 200 status code' do
      expect(author.name).to eql('Original Dude')
      put :update, params: {id: author.id, name: 'New Dude'}
      expect(response).to have_http_status(204)
      expect {author.reload}.to change{author.name}.from('Original Dude').to('New Dude')
    end

    context 'invalid Author id' do
      it 'returns 404 status code' do
        put :update, params: {id: 0, name: 'New Dude'}
        expect(response).to have_http_status(404)
      end
    end

    context 'missing Author name' do
      it 'returns 400 status code' do
        put :update, params: {id: author.id, nickname: 'New Dude'}
        expect(response).to have_http_status(400)
      end
    end
  end
end
