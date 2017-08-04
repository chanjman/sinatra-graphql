$:.unshift File.join(File.dirname(__FILE__), "lib")

require "rubygems"
require "sinatra"

require_relative "config/init"
require_relative "routes/graphql"


module TodoApp
  class App < Sinatra::Base
    get "/" do
      @title = "Todo App"
      erb :index
    end

    use Routes::Graphql
  end
end
