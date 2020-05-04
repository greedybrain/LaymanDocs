require "nokogiri"
require "open-uri"

class Question < ApplicationRecord
     validates :url, :topic, :pasted_info, presence: true
     validates :pasted_info, uniqueness: true


     # belongs_to :layman
     has_many :elabs, dependent: :destroy
     has_many :upvotes, dependent: :destroy
     has_many :downvotes, dependent: :destroy

      def self.get_doc_content_by(url)
          info = {}
          begin
               scraped_info = Nokogiri::HTML(open(url))
          rescue Errno::ENOENT => e
               invalid_message = "Please enter a valid link"
               raise invalid_message
          ensure
               if invalid_message
                    url = invalid_message
                    return url
               else
                    url = scraped_info
               end
          end

          textCollection = scraped_info.css("*").collect do |el|
               el.text
          end.join('').split(' ')

          info[:title] = scraped_info.css('title').text
          info[:body] = clean_up(textCollection)
          info
     end
     
     def self.get_laymans_paste_info(laymans_paste)
          # binding.pry
          post = laymans_paste.split(' ')
          clean_up(post)
     end

     def self.clean_up(arr)
          toFilter = /[!@#$%^&*\(\)\\\/?\[\]<>,\.`~\{\}+=\-_œ∑´®†¥¨ˆøπ“‘«æ…¬˚∆˙©ƒ∂ßåΩ≈ç√∫˜µ≤≥÷≠–ºª•¶§∞¢£™¡"':;|]/
          arr.join(' ').gsub(/[^[:ascii:]]/, " ").gsub(toFilter, ' ').gsub(" ", "")
     end

end
