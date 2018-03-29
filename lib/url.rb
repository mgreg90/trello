module Trello
  module CLI

    module Commands
      extend Playwright::CLI::Registry

      class Url < Playwright::CLI::Command
        def call(**)
          fetch_url
          echo_url
        end

        def fetch_url
          if !File.exists? TRELLO_FILE || File.read(TRELLO_FILE).length == 0
            display.error "No trello url saved!"
          end
          @url = File.read(TRELLO_FILE).chomp
        end

        def echo_url
          display.color_print "Your trello url is:"
          display.color_print @url
        end

      end

    end
  end
end