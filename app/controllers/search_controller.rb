class SearchController < ApplicationController
  def index
  end

  def search
    term = params[:search_term]
    @results = ItunesService.search(term)

    @favorites = Album.where(is_favorite: true).pluck(:collection_id)
    respond_to do |format|
      format.js
    end
  end

  def toggle_favorite
    @album = Album.find_or_create_by(collection_id: params[:collection_id]) do |album|
      album.is_favorite = false
    end
  
    if @album.persisted?
      @album.update(is_favorite: !@album.is_favorite)
    end
    
    render json: { is_favorite: @album.is_favorite }
  end
end
