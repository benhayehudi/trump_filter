class TrumpFilter::Scraper

  def self.scrape_headline_news
    doc = Nokogiri::HTML(open("https://news.google.com/news/section?cf=all&pz=1&topic=n&siidp=295b6c301c20ea36b29285743b52b796b431&ict=ln"))
    @news_parsed = []
    @news_link_parsed = []
    doc.css("div.blended-wrapper.blended-wrapper-first").each do |headline|
      @news_parsed << {
        :title => headline.css("h2.esc-lead-article-title").text
      }
    end
    doc.css("div.blended-wrapper.blended-wrapper-first").each do |link|
      @news_link_parsed << {
        :link => link.css("a").attribute("href").text
      }
    end
  #  "#{@news_parsed[0][:title]}"
  #  "#{@news_parsed[0][:link]}"
  end

  def self.scrape_trump_tweet
    doc = Nokogiri::HTML(open("https://twitter.com/POTUS"))
    @tweet_parsed = []

    doc.css("li#stream-item-tweet-879034963672403968.js-stream-item div.tweet").each do |tweet|
      @tweet_parsed << {
        :message => tweet.css("p.TweetTextSize").text,
        :date => tweet.css("span._timestamp").text
      }
    end
  #  "#{@tweet_parsed[0][:message]}"
  #  "#{@tweet_parsed[0][:date]}"
  end

  def self.get_news_title
    "#{@news_parsed[0][:title]}"
  end

  def self.get_news_link
    "<a href='#{@news_link_parsed[0][:link]}'>#{@news_link_parsed[0][:link]}</a>"

  #  "#{@news_parsed[0][:link]}"
  end

  def self.get_tweet_message
    "#{@tweet_parsed[0][:message]}"
  end

  def self.get_tweet_date
    "#{@tweet_parsed[0][:date]}"
  end
end
