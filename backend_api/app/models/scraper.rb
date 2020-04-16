require "nokogiri"
require "open-uri"

class Scraper < ApplicationRecord



end


def filterText(arr)
 toFilter = /[!@#$%^&*\(\)\\\/?\[\]<>,\.`~\{\}+=\-_œ∑´®†¥¨ˆøπ“‘«æ…¬˚∆˙©ƒ∂ßåΩ≈ç√∫˜µ≤≥÷≠–ºª•¶§∞¢£™¡"':;|]/
 arr.join(' ').gsub(/[^[:ascii:]]/, " ").gsub(toFilter, ' ').gsub(" ", "")
end

def doesInfoProvidedByThisLink(url)
 textCollection = Nokogiri::HTML(open(url)).css("*").collect do |el|  el.text
 end.join('').split(' ')
 return filterText(textCollection)
end

def usersPieceOfDocumentation(users_post)
 post = users_post.split(' ')
 return filterText(post)
end

multi_line_post = ""

doesInfoProvidedByThisLink("https://guides.rubyonrails.org/getting_started.html").include?(usersPieceOfDocumentation(multi_line_post))
