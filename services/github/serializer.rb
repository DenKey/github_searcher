# frozen_string_literal: true

module GitHub
  class Serializer
    class << self
      def repositories(response)
        response[:items].map {|item| {full_name: item[:full_name], url: item[:html_url]}}
      end
    end
  end
end
