require "lita"
require "google-search"

module Lita
  module Handlers
    class GoogleRanking < Handler

      def self.default_config(config)
        # http://en.wikipedia.org/wiki/ISO_3166-1#Current_codes
        config.gl = nil
        # https://developers.google.com/custom-search/docs/xml_results?hl=en&csw=1#languageCollections
        config.lr = nil
        # https://developers.google.com/custom-search/docs/xml_results?hl=en&csw=1#countryCollections
        config.cr = nil
        # domain alias
        config.default_domain = nil
      end      

      route /^gr\s+([^ ]+)\s+(.+)/i, :gr, :help => {
        "gr DOMAIN KEYWORD" => "send KEYWORD to google web search, and return rank of DOMAIN from search results"
      }
      def gr(response)
        # raise response.matches.inspect

        # domain alias support
        if config(:default_domain)[:alias] == response.matches.first.first
          domain = config(:default_domain)[:domain]
        else
          domain = response.matches.first.first
        end

        keyword = response.matches.first[1]
        results = Google::Search::Web.new(:query => keyword, :safety_level => :off, :gl => config(:gl), :lr => config(:lr), :cr => config(:cr), :size => :large)
        rank = nil
        results.each do |res|
          if res.uri.index(domain)
            rank = res.index + 1
            break
          end
        end
        if rank
          response.reply "\"#{keyword}\" ranking of #{domain} is #{rank}"
        else
          response.reply "\"#{keyword}\" ranking of #{domain} doesn't appear in search restults"
        end
      end

      private

      def config(key)
        Lita.config.handlers.google_ranking.send(key)
      end

    end

    Lita.register_handler(GoogleRanking)
  end
end
