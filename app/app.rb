require 'sinatra'
require 'bundler'
Bundler.require
require_all './services'

module GitHubSearcher
  class App < Sinatra::Base
    get '/' do
      erb :index
    end

    get '/search' do
      if params['query']
        response = GitHub::Service.repositories(params['query'])
        @result = GitHub::Serializer.repositories(response)
      end
      erb :index
    rescue StandardError => e
      @error = e.message
      erb :index
    end

    error 400..510 do
      erb :index
    end
  end
end