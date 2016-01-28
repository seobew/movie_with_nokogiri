class HomeController < ApplicationController
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	before_action :authenticate_user!, only: [:index]
  def index
		url = "http://movie.naver.com/movie/sdb/rank/rboxoffice.nhn?nation=kor"
		doc = Nokogiri::HTML(open(url))
		@ranks = doc.search('div.tit1').map(&:text)
		# get images
		url2 = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&ie=utf8&query=%EC%98%81%ED%99%94"
		doc2 = Nokogiri::HTML(open(url2))
		@alt_tags = Array.new
		@alt_tags = doc2.css('div.thmb img').map(|j| j['alt']}
		@movies = Array.new
		@movies = doc2.css('div.thmb img').map{ |i| i['src'] } # array of image urls [url1, url2, url3]
  end
end
