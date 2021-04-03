class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name, artist = nil)
        @name = name
        @artist = artist if artist != nil
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

    #what's the difference between Create and Initialize?
    
    def self.create(name)
        created_song = self.new(name)
        created_song.save
        created_song
    end
    # binding.pry 
end

