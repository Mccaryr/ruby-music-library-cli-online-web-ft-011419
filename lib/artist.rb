class Artist
<<<<<<< HEAD
    extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []



  def initialize(name)
    @name=name
    # @@all << self
=======
  attr_accessor :name
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name=name
    @@all << self
>>>>>>> bc46adcf7863010c858a851e9e363b1c96a8e077
    @songs = []
  end

  def add_song(song)
<<<<<<< HEAD
    song.artist = self unless song.artist
=======
    song.artist = self unless song.artist == self
>>>>>>> bc46adcf7863010c858a851e9e363b1c96a8e077
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
<<<<<<< HEAD
     if !@@all.include?(self)
       @@all << self
     end
=======
     @@all << self
>>>>>>> bc46adcf7863010c858a851e9e363b1c96a8e077
   end

  def self.create(name)
    artist = self.new(name)
<<<<<<< HEAD
    artist.save
    # @@all << artist
=======
    @@all << artist
>>>>>>> bc46adcf7863010c858a851e9e363b1c96a8e077
    artist
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
  end
  genres.uniq
end
end
