# frozen_string_literal: true

require './services/github/client'

module GitHub
  class Service
    def initialize
      @client = GitHub::Client.new
    end

    attr_accessor :client

    class << self
      def repositories(query)
        new.client.get!("search/repositories?q=#{query}&sort=stars&order=desc")
      end
    end
  end
end
