require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let!(:album) { Album.create(collection_id: '123', is_favorite: true) }

  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  describe '#search' do
    before do
      allow(ItunesService).to receive(:search).and_return([])
      get :search, params: { search_term: 'test' }, xhr: true
    end

    it 'calls the ItunesService' do
      expect(ItunesService).to have_received(:search).with('test')
    end

    it 'responds successfully' do
      expect(response).to be_successful
    end

    it 'assigns @results' do
      expect(assigns(:results)).to eq([])
    end

    it 'assigns @favorites' do
      expect(assigns(:favorites)).to eq([album.collection_id])
    end
  end

  describe '#toggle_favorite' do
    context 'when album exists' do
      it 'toggles the favorite status of the album' do
        post :toggle_favorite, params: { collection_id: album.collection_id }, format: :json
        expect(album.reload.is_favorite).to eq(false)
      end
    end

    context 'when album does not exist' do
      it 'creates the album and sets is_favorite to true' do
        post :toggle_favorite, params: { collection_id: '456' }, format: :json
        new_album = Album.find_by(collection_id: '456')
        expect(new_album).not_to be_nil
        expect(new_album.is_favorite).to eq(true)
      end
    end
  end
end