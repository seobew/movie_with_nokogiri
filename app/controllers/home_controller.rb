class HomeController < ApplicationController
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'

	before_action :authenticate_user!, only: [:index]
  def index
		url = "http://movie.naver.com/movie/sdb/rank/rboxoffice.nhn?nation=kor"
		doc = Nokogiri::HTML(open(url))
		@ranks = doc.search('div.tit1').map(&:text)
		@graphdata = doc.search('td.reserve_cnt.ar em').map(&:text)
		@graphdata_array = Array.new
		@graphdata_array = @graphdata.map{|n| n.to_i}
		@weekenddate = doc.search('div.tab_type_6.tab_type_none p').text
		# get images
		#url2 = "http://movie.naver.com/movie/running/current.nhn"
		url2 = "http://movie.naver.com/movie/running/current.nhn?view=list&tab=normal&order=reserve"
#		url2 = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&ie=utf8&query=%EC%98%81%ED%99%94"
		doc2 = Nokogiri::HTML(open(url2))
		@alt_tags = Array.new
#		@alt_tags = doc2.css('div.thmb img').map{|j| j['alt']}
		@alt_tags = doc2.css('div.thumb img').map{|j| j['alt']}
		@movies = Array.new
#		@movies = doc2.css('div.th}b img').map{ |i| i['src'] } # array of image urls [url1, url2, url3]
		@movies = doc2.css('div.thumb img').map{ |i| i['src'] } # array of image urls [url1, url2, url3]
		@length = @movies.length

		@moviepost = Moviepost.all

		# chart graph
		@chart = LazyHighCharts::HighChart.new('graph') do |f| f.title(text: "각 영화별 주말 관객 수")
			f.xAxis(categories: @ranks)
			# 막대그래프용
		#	f.series(name: @weekenddate, yAxis: 0, data: @graphdata.map{|n| n.to_i})
			f.series(name: @weekenddate, yAxis: 0, data: @graphdata_array)

			f.yAxis [
				{title: {text: "관객수", margin: 70} },
				{title: {text: "Population in Millions"}, opposite: true},
			]

			f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
			f.chart({defaultSeriesType: "column"})
		end
		#
		#	pie chart

		@chart3 = LazyHighCharts::HighChart.new('pie') do |f|
			f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
			series = {
				:type=> 'pie',
				:name=> @weekenddate,
				:data=> [
#					['Firefox',   45.0],
#					['IE',       26.8],
#					{
#				:name=> 'Chrome',
#				:y=> 12.8,
#				:sliced=> true,
#				:selected=> true
#			},
#				['Safari',    8.5],
#				['Opera',     6.2],
#				['Others',   0.7]
#					@ranks.each_with_index do |x, index|
#				[x, @graphdata_array[index]]
#				puts x
#				puts @graphdata_array[index]
#					end
					[@ranks[0], @graphdata_array[0]],
					[@ranks[1], @graphdata_array[1]],
					[@ranks[2], @graphdata_array[2]],
					[@ranks[3], @graphdata_array[3]],
					[@ranks[4], @graphdata_array[4]],
					[@ranks[5], @graphdata_array[5]],
					[@ranks[6], @graphdata_array[6]],
					[@ranks[7], @graphdata_array[7]],
					[@ranks[8], @graphdata_array[8]],
					[@ranks[9], @graphdata_array[9]]
			]
			}
			f.series(series)
			f.options[:title][:text] = "각 영화별 주말 관객 수"
			f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'})
			f.plot_options(:pie=>{
				:allowPointSelect=>true,
				:cursor=>"pointer" ,
				:dataLabels=>{
				:enabled=>true,
				:color=>"black",
				:style=>{
				:font=>"13px Trebuchet MS, Verdana, sans-serif"
			}
			}
			})
		end

  end
end
