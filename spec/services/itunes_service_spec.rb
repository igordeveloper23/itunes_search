require 'rails_helper'

RSpec.describe ItunesService, type: :service do
  describe '.search' do
    it 'returns parsed JSON from iTunes API' do
      results = ItunesService.search('test')

      expect(results).to be_kind_of(Array)
      expect(results.first['collectionName']).to eq('This Is Not a Test!')
    end
  end
end