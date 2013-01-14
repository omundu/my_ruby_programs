require 'net/http'
require 'open-uri'
require 'nokogiri'
require 'hpricot'

def count_occurence_of_the(gem_name, http_content)
  puts "Using #{gem_name}: #{http_content.downcase.scan(/\w+/).count("the")}"
end

def count_using_net_http(url)
  uri = URI.parse(url)
  Net::HTTP.start(uri.host, uri.port) do |http|
    req = Net::HTTP::Get.new(uri.path)
    count_occurence_of_the("net/http and URI", http.request(req).body)
  end
end

def count_using_uri(url)
  count_occurence_of_the("open-uri", open(url).readlines.join)
end

def count_using_hpricot(url)
  count_occurence_of_the("hpricot", Hpricot(open(url)).at(:body).inner_html)
end

def count_using_nokogiri(url)
  count_occurence_of_the('nokogiri', Nokogiri::HTML(open(url)).at(:body).inner_html)
end

def count_them_up
  url = 'http://ruby-metaprogramming.rubylearning.com/html/ruby_metaprogramming_1.html'
  
  count_using_net_http(url)
  count_using_uri(url)
  count_using_hpricot(url)
  count_using_nokogiri(url)
end

count_them_up