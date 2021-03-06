class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name=name
    self.artist=(artist) unless artist==nil
    self.genre=(genre) unless genre==nil
    # @@all << self
  end


  def name=name
    @name=name
  end

  def name
    @name
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song, artist=nil, genre=nil)
    new_song = Song.new(song, artist, genre)
    new_song.save
    return new_song
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=genre
    @genre=genre
    self.genre.songs << self unless genre.songs.include?(self)
  end

def self.find_by_name(song)
  self.all.find {|x| x.name == song}
end

def self.find_or_create_by_name(song)
  find_by_name(song) || create(song)
end

def self.new_from_filename(file_name)
  parts = file_name.split(" - ")
  artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
  self.new(song_name, artist, genre)
end

def self.create_from_filename(file_name)
  # parts = file_name.split(" - ")
  # artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")
  #
  # artist = Artist.find_or_create_by_name(artist_name)
  # genre = Genre.find_or_create_by_name(genre_name)
  # # self.new_from_filename(file_name)
  new_song = new_from_filename(file_name)
  new_song.save
end
end
