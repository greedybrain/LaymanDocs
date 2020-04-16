require "nokogiri"
require "open-uri"

class Scraper < ApplicationRecord

     def self.get_doc_content_by(url)
          info = {}
          begin
               scraped_info = Nokogiri::HTML(open(url))
          rescue OpenURI::HTTPError => e
               raise "Something went wrong with that link"
          end

          textCollection = scraped_info.css("*").collect do |el|
               el.text
          end.join('').split(' ')

          info[:title] = scraped_info.css('title').text.delete!("^\u{0000}-\u{007F}")
          info[:body] = clean_up(textCollection)
          info
     end
     
     def self.get_laymans_paste_info(laymans_post)
          post = laymans_post.split(' ')
          clean_up(post)
     end

     def self.clean_up(arr)
          toFilter = /[!@#$%^&*\(\)\\\/?\[\]<>,\.`~\{\}+=\-_œ∑´®†¥¨ˆøπ“‘«æ…¬˚∆˙©ƒ∂ßåΩ≈ç√∫˜µ≤≥÷≠–ºª•¶§∞¢£™¡"':;|]/
          arr.join(' ').gsub(/[^[:ascii:]]/, " ").gsub(toFilter, ' ').gsub(" ", "")
     end

end




# multi_line_post = ""

# doesInfoProvidedByThisLink("https://guides.rubyonrails.org/getting_started.html").include?(usersPieceOfDocumentation(multi_line_post))
