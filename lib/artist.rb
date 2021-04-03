class Artist
    extend Concerns::Findable

    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
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
        created_artist = self.new(name)
        created_artist.save
        created_artist
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    
    def add_song(song)
         if song.artist == nil

            song.artist = self
         else

            nil
         end
    end
    
    def genres
        songs.map {|song| song.genre}.uniq
    end

end