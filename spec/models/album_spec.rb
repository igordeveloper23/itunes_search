require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'is not valid without a collection_id' do
    album = Album.new(collection_id: nil)
    expect(album).to_not be_valid
  end

  it 'is valid with a collection_id' do
    album = Album.new(collection_id: '1234')
    expect(album).to be_valid
  end
end