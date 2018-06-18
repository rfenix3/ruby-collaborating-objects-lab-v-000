require 'pry'

class Artist
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
#    @@all << name
  end
  
  def self.all
    @@all
  end

  def songs 
    @songs 
  end
  
  def add_song(song)
    @songs << song
  end
  
  def save
    @@all << self
  end
  
  def self.find_or_create_by_name(artist)
    if (self.all.find{|n| n.name == artist}.nil?)
      self.new(artist).tap {|x| x.save}
    else
      self.all.find{|n| n.name == artist}
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
  
end

