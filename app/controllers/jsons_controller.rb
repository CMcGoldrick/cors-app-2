class JsonsController < ApplicationController
  def jsoncors
    require 'net/http'
    require 'openssl'
    require 'json'
    
    uri = URI('https://api.espace.cool/api/v1/event/list')
  
    Net::HTTP.start(uri.host, uri.port,
    :use_ssl => uri.scheme == 'https', 
    :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
  
    request = Net::HTTP::Get.new uri.request_uri
    request.basic_auth 'tylerh@firmfoundationsmarketing.com', 'upwork'
  
    response = http.request request # Net::HTTPResponse object
  
    data = response.body
    @events = JSON.parse(data)["Data"]

    render :json => @events

    end 
  end 
end
