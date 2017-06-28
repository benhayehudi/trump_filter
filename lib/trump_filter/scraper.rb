class TrumpFilter::Scraper

  attr_accessor :title, :link, :message, :date

  def self.scrape_headline_news
    doc = Nokogiri::HTML(open("https://news.google.com/news/headlines?ned=us&hl=en"))
    @news_parsed = []
    @news_link_parsed = []
    # doc.css("c-wiz.PaqQNc.PBWx0c").each do |headline|
    #   @news_parsed << {
    #     :title => headline.css("a.nuEeue").first.text
    #   }
    # end
    @news_parsed << doc.css("c-wiz.PaqQNc.PBWx0c").css("a.nuEeue").first.text
    @news_link_parsed << doc.css("c-wiz.PaqQNc.PBWx0c c-wiz.M1Uqc.kWyHVd a.nuEeue").attribute("href").text
    #   @news_link_parsed << {
    #     :link => link.css("a").attribute("href").text
    #   }
    # end
    puts "#{@news_parsed[0]}"
    puts "#{@news_link_parsed[0]}"
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
    "#{@news_parsed[0]}"
  end

  def self.get_news_link
    "<a href='#{@news_link_parsed[0]}'>#{@news_link_parsed[0]}</a>"

  #  "#{@news_parsed[0][:link]}"
  end

  def self.get_tweet_message
    "#{@tweet_parsed[0][:message]}"
  end

  def self.get_tweet_date
    "#{@tweet_parsed[0][:date]}"
  end
end
