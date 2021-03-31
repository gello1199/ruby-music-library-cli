class Genre
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(genre)
        new_genre = self.new(genre)
        new_genre.save
        new_genre
    end

    def songs
        Song.all.select {|songs| songs.genre == self}
    end

    def artists
        songs.map {|song| song.artist}.uniq
    end

end

