class ArtworkController < ApplicationController
  def index
    @unsplash_images = Unsplash::Photo.search('art', 1, 12)
  end
end
