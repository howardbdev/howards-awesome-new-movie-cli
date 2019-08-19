class Scraper

  BASE_URL = "https://www.imdb.com"
  def self.scrape_titles
    doc = Nokogiri::HTML(open("https://www.imdb.com/movies-coming-soon/"))
    titles = doc.css("td.overview-top h4 a")
    titles.each do |t|
      title = t.children[0].text.strip
      href = BASE_URL + t.attributes["href"].value
      Movie.new(title: title, url: href)
    end
  end

  def self.scrape_details(movie)
    details_doc = Nokogiri::HTML(open(movie.url))
    movie.summary = details_doc.css("div.summary_text")[0].children.text.strip
  end
end
