class AppRequestsController < ApplicationController
  		layout "pv_home"
	def change_currency
	  	@currency = params[:currency] #cor or usd
	  	respond_to do |format|
		  	format.js
	  	end
  	end

  	def search_by_params
      if params[:q].present?
        url=URI.parse("https://www.googleapis.com/customsearch/v1?key=#{APIKEY}&cx=#{APPID}&q=#{params[:q]}")
        request = Net::HTTP::Get.new(url.to_s)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == "https")
        response = http.request(request)
        @items = JSON.parse(response.body)["items"]
      end

      @page = Refinery::Page.where(:link_url => "/resultado-de-busqueda").first
        present(@page)
      end
end