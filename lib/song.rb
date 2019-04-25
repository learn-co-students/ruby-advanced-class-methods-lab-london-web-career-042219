require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    return self
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(song_name)
    temp = self.new
    temp.name=(song_name)
    return temp
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name).save
  end

  def self.find_by_name(target_name)
    return self.all.find { |song| song.name == target_name }
  end

  def self.find_or_create_by_name(target_name)
    self.find_by_name(target_name) != nil ? self.find_by_name(target_name) : self.create_by_name(target_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  
  def self.new_from_filename(filename)
    temp = find_or_create_by_name(self.filename_parse(filename)[1])
    temp.artist_name=(self.filename_parse(filename)[0])
    return temp
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.filename_parse(filename)
    filename_array = []
    filename_array << filename.split(" - ")[0]
    filename_array << filename.split(" - ")[1].split(".")[0]
  end

  def self.destroy_all
    @@all.clear
  end
end
