module Trello
  module CLI

    module Commands
      extend Playwright::CLI::Registry

      class Set < Playwright::CLI::Command

        URL_REGEX = /^#{URI::regexp}/i
        TRELLO_URL_REGEX = /^http(s?):\/\/trello.com/i

        argument :url, required: true, desc: "url for trello board"

        desc "Sets the url for a project's trello board."

        example ["https://trello.com/b/45vx2CuL/my-app #=> stores url to trello board"]

        def call(url:, **)
          @url = url
          validate!
          save_url
          display.color_print "Trello url set!"
        end

        private

        def validate!
          display.error "Invalid url!" unless valid_url?
          display.error "That url doesn't go to trello!" unless trello_url?
        end

        def valid_url?
          URL_REGEX =~ @url
        end

        def trello_url?
          TRELLO_URL_REGEX =~ @url
        end

        def save_url
          FileUtils.touch TRELLO_FILE
          File.open TRELLO_FILE, 'w+' do |file|
            file.write @url
          end
        end

      end

    end
  end
end