# semaine2-jour4
Travail effectué avec @Mathieu M, @Tomroumeg , @Kalisp
notions nokogiri, scraping

####==============BONUS DU TRADER JUSTE POUR LE FUN==================###

def every_so_many_seconds(seconds)
    last_tick = Time.now
    loop do
      sleep 0.1
      if Time.now - last_tick >= seconds
        last_tick += seconds
        yield
      end
    end
  end

def perform
    every_so_many_seconds(30) do
      p Time.now
      get_urls("https://coinmarketcap.com/all/views/all/")
    end
end

perform

