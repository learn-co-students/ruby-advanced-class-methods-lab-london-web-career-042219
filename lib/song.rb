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
   new_song_name = filename.split(/ - |.mp3/)
   song = new_by_name(new_song_name[1])
   song.artist_name = new_song_name[0]
   song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
