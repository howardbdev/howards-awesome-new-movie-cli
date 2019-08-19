class CLI

  def initialize
    @input = ""
  end

  def call
    Scraper.scrape_titles
    run
  end

  def run
    show_titles
    prompt_input
    get_input
    if @input.downcase != "exit"
      validate_input
    end
  end

  def show_titles
    Movie.all.each_with_index {|movie, i| puts "#{i + 1}. #{movie.title}"}
  end

  def prompt_input
    puts "See details for a movie by typing its number"
  end

  def get_input
    @input = gets.strip
  end

  def validate_input
    if @input.to_i.between?(1,7)
      movie = Movie.all[@input.to_i - 1]
      Scraper.scrape_details(movie)
      show_movie_details(movie)
    else
      puts "sorry that's not valid try again"
      run
    end
  end

  def show_movie_details(movie)
    puts ""
    puts "***********************************"
    puts "Title: #{movie.title}"
    puts "Summary: #{movie.summary}"
    puts "Website: #{movie.url}"
    puts "***********************************"
    puts ""
  end

end
