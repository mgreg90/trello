module Trello
  module CLI

    module Commands
      extend Playwright::CLI::Registry

      class Open < Playwright::CLI::Command
        desc "Opens your trello board in your default browser"

        def call(**)
          os.open_url url: url, name: 'trello'
        end

        private

        def url
          @url ||= begin
            if !File.exists? TRELLO_FILE || File.read(TRELLO_FILE).length == 0
              display.error "No trello url saved!"
            end
            File.read(TRELLO_FILE).chomp
          end
        end

      end
    end
  end
end