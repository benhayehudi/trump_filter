class TrumpFilter::CLI < TrumpFilter::Scraper


  def call
    puts "Welcome to the Trump Filter!"
    get_trump_filter
  end

  def get_trump_filter
  TrumpFilter::Scraper.scrape_headline_news
  TrumpFilter::Scraper.scrape_trump_tweet
  end

end
