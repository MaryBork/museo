require 'pry'


class Curator
  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photograph)
    @photographs << Photograph.new(photograph)

  end

  def add_artist(artist)
    @artists << Artist.new(artist)

  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photograph|
      photograph.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photograph|
      photograph.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    photos_by_artist_count = Hash.new(0)
    @photographs.each do |photo|
      photos_by_artist_count[photo.artist_id] += 1
    end

    count_above_two = photos_by_artist_count.find_all do |k, v|
       v >= 2
    end

    artists_with_multiple_photos = []
    count_above_two.each do |k, v|
     artists_with_multiple_photos << @artists.id == k
   end

   artists_with_multiple_photos


    # photo_count = {}
    #
    # artist_photos.find_all do |photo|
    #   photo.artist

    # counted = artist_photos.each do |artist_id, object|
    #   photo_count[artist_id] += 1
    # end
    #
    # artists_with_multiple_photos_id = []
    # counted.each do |k, v|
    #   if v >= 2
    #     artists_with_multiple_photos_id << k
    #   end
    #
    #   artists_with_multiple_photos = []
    #   artists_with_multiple_photos_id.each do |id|
    #     artists_with_multiple_photos << @artists.find_artist_by_id(id)
    #   end
    #
    #   artists_with_multiple_photos
  end



end
