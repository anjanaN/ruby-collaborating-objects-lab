class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def self.find_or_create_by_name(name)
    if @@all.any? { |artist| artist.name == name}
      i = @@all.index { |artist| artist.name == name}
      @@all[i]
    else
      new_artist = Artist.new(name)
    end
  end

  def print_songs
    Song.all.each do |song|
      if song.artist == self
        song.artist
      end
    end
  end
end
