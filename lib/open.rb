module Trello
  module CLI

    module Commands
      extend Playwright::CLI::Registry

      class Open < Playwright::CLI::Command
        def call(**)
          fetch_url
          open_url
        end

        def fetch_url
          if !File.exists? TRELLO_FILE || File.read(TRELLO_FILE).length == 0
            display.error "No trello url saved!"
          end
          @url = File.read(TRELLO_FILE).chomp
        end

        def open_url
          success = %x[ open #{@url} ]
          if success
            display.color_print "Opening trello in your default browser..."
          else
            display.error "Something went wrong!"
          end
        end

      end

    end
  end
end