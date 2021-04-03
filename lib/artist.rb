class Artist
    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        save
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

    #How exactly does this code work? Is it just repeating the initialize method in Song?
    def add_song(song)
         if song.artist == nil
            song.artist = self
         else
            nil
         end
    end

end

