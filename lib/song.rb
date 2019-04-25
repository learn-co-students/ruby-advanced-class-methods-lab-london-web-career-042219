class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if not song
      song = create_by_name(name)
    end
    song
  end

  def self.alphabetical
    @@all.sort { |song_a, song_b| song_a.name <=> song_b.name }
  end

  def self.new_from_filename(filename)
    bits = filename.split(/ - |.mp3/)
    song = new_by_name(bits[1])
    song.artist_name = bits[0]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end
