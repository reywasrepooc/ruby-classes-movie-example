class Movie
  attr_accessor :name, :genre, :year

  @@count = 0
  @@genres = []

def initialize(name, genre, year)
    @name = name
    @genre = genre
    @year = year
    @@count += 1
    @@genres << genre

    end

    def self.count
        @@count
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        hash = {}
        @@genres.each do |genre|
            if hash.key? genre
                hash[genre] += 1
            else 
                hash[genre] = 1
            end
        end
        hash
    end
end