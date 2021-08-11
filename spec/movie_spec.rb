require "spec_helper"

describe Movie do
  describe 'instance methods' do
    let!(:troll_2) { Movie.new('Troll 2', 'Comedy', '1990') }

    describe '#initialize' do
      it 'takes in three arguments: a name, genre and year' do
        expect { Movie.new('Troll 2', 'Comedy', '1990') }.not_to raise_error
      end
    endf

    describe '#name' do
      it 'returns the name' do
        expect(troll_2.name).to eq('Troll 2')
      end
    end

    describe '#artist' do
      it 'returns the artist' do
        expect(troll_2.genre).to eq('Comedy')
      end
    end

    describe '#genre' do
      it 'returns the genre' do
        expect(troll_2.year).to eq('1990')
      end
    end
  end

  describe 'class methods' do

    # This `before` block runs before each test so we can start with a clean slate
    before do
      # reset the class variables
      Movie.class_variable_set(:@@genres, [])
      Movie.class_variable_set(:@@count, 0)
      Movie.class_variable_set(:@@genre_count, {})

      # create new instances using the Movie class
      Movie.new("Hot Fuzz", "Comedy", "2007")
      Movie.new("Casablanca", "Drama", "1942")
      Movie.new("Troll 2", "Comedy", "1990")
    end

    describe 'class variables' do
      it 'has a class variable, @@count' do
        expect(Movie.class_variable_get(:@@count)).to eq(3)
      end

      it "has a class variable, @@genres, that contains all of the genres of existing Movies" do
        expect(Movie.class_variable_get(:@@genres)).to match(["Comedy", "Drama", "Comedy"])
      end
    end

    describe ".count" do
      it "is a class method that returns that number of Movies created" do
        expect(Movie.count).to eq(3)
      end
    end

    describe ".genres" do
      it "is a class method that returns a unique array of genres of existing Movies" do
        expect(Movie.genres).to match(["Comedy", "Drama"])
      end
    end

    describe ".genre_count" do
      it "is a class method that returns a hash of genres and the number of Movies that have those genres" do
        expect(Movie.genre_count).to eq({ "Comedy" => 2, "Drama" => 1 })
      end
    end
  end
end
