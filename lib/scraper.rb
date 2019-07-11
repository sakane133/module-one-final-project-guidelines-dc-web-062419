require './config/environment.rb'

# ignore this: it didn't make the cut

class Scraper
  def scrape_index
    html = open("https://learn.co/tracks/web-development-immersive-2-0-module-one")
    # TODO: not able to pull from page where user is logged in.
    nav_tree = home_page.css(".site-nav__item")
    # nav_tree = home_page.css("div.menu.site-nav-wrapper li.site-nav__item.site-nav__item--level-1")
    # binding.pry # check what "nav_tree" returns
    lessons_array = []
    nav_tree.each do |lsn|
      # binding.pry # check what "l" returns - should only be one lesson
      lessons_array << {
        :category => lsn.css("css-selector-here").text,
        :sub_category => lsn.css("css-selector-here").text,
        :single_lesson => lsn.css("css-selector-here").text,
        :repo_url => lsn.css("a").attribute("href").value
      }
    end
    lessons_array
    # binding.pry # check what the function returns; should be an array of hashes
  end
end

# test = Scraper.new
# test.scrape_index
