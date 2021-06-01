class Scrapper

    def get_page
 
        Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
     
        #doc.css(".post").each do |post|
          #course = Course.new
          #course.title = post.css("h2").text
          #course.schedule = post.css(".date").text
          #course.description = post.css("p").text
        #end
    end

end