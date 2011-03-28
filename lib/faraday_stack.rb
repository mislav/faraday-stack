# encoding: utf-8
require 'faraday'
require 'forwardable'

module FaradayStack
  extend Faraday::AutoloadHelper
  
  autoload_all 'faraday_stack',
    :ResponseMiddleware => 'response_middleware',
    :ResponseJSON => 'response_json',
    :ResponseXML => 'response_xml',
    :ResponseHTML => 'response_html',
    :Instrumentation => 'instrumentation',
    :Caching => 'caching',
    :FollowRedirects => 'follow_redirects'
  
  # THE ÜBER STACK
  def self.default_connection
    @default_connection ||= self.build
  end
  
  class << self
    extend Forwardable
    attr_writer :default_connection
    def_delegators :default_connection, :get, :post, :put, :head, :delete
  end
  
  def self.build(url = nil, options = {})
    Faraday::Connection.new(url, options) do |builder|
      builder.request :url_encoded
      builder.request :json
      yield builder if block_given?
      builder.use ResponseXML,  :content_type => /[+\/]xml$/
      builder.use ResponseHTML, :content_type => 'text/html'
      builder.use ResponseJSON, :content_type => 'application/json'
      builder.use FollowRedirects
      builder.response :raise_error
      builder.adapter Faraday.default_adapter
    end
  end
end
