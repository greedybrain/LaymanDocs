# require "nokogiri"
# require "open-uri"

# class Scraper < ApplicationRecord

#      def self.get_doc_content_by(url)
#           info = {}
#           begin
#                scraped_info = Nokogiri::HTML(open(url))
#           rescue OpenURI::HTTPError => e
#                raise "Something went wrong with that link"
#           end

#           textCollection = scraped_info.css("*").collect do |el|
#                el.text
#           end.join('').split(' ')

#           info[:title] = scraped_info.css('title').text
#           info[:body] = clean_up(textCollection)
#           info
#      end

#      @@question = current_layman.questions.build
#      questions_that_include_url = Question.all.select{|q| q.url == params[:url]}
#      if questions_that_include_url.count > 0 
#           render json: {
#                message: "Related Searches",
#                posts: QuestionSerializer.new(questions_that_include_url).serializable_hash
#           }
#      else
#           @@documentation_by_url = Scraper.get_doc_content_by(params[:url])
#           binding.pry
#           @@question.url = params[:url]
#           render json: { 
#                message: @@documentation_by_url[:title]
#           }
#      end
     
#      def self.get_laymans_paste_info(laymans_paste)
#           post = laymans_paste.split(' ')
#           clean_up(post)
#      end

#      def self.clean_up(arr)
#           toFilter = /[!@#$%^&*\(\)\\\/?\[\]<>,\.`~\{\}+=\-_œ∑´®†¥¨ˆøπ“‘«æ…¬˚∆˙©ƒ∂ßåΩ≈ç√∫˜µ≤≥÷≠–ºª•¶§∞¢£™¡"':;|]/
#           arr.join(' ').gsub(/[^[:ascii:]]/, " ").gsub(toFilter, ' ').gsub(" ", "")
#      end

# end
