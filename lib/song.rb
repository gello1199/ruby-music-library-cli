class Song
    attr_accessor :name, :genre
    attr_reader :artist

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist != nil 
        self.genre = genre if genre != nil
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        self.all.clear
    end

    
    def self.create(name)
        created_song = self.new(name)
        created_song.save
        created_song
    end

    def self.find_by_name(name)
        self.all.detect {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || self.create(name)
    end

    def self.new_from_filename(filename)
        artist_name = filename.split(" - ")[0]
        song_name = filename.split(" - ")[1]
        genre_name = filename.split(" - ")[2].chomp(".mp3")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end


end
