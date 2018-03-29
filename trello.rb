#!/usr/bin/env ruby

require 'playwright/cli'
require_relative 'lib/version'

module Trello
  module CLI
    module Commands
      extend Playwright::CLI::Registry

      class Greet < Playwright::CLI::Command
        desc "Says a greeting to the name given. This is an example."

        argument :name, required: true, desc: 'Whom shall I greet?'

        example [
          "\"Johnny Boy\" #=> Why, hello Johnny Boy!"
        ]

        def call(name:, **)
          puts "Why, hello #{name}!"
        end

      end

      register 'greet', Greet
      register 'version', Version, aliases: ['v', '-v', '--version']

    end
  end
end

Playwright::CLI.new(Trello::CLI::Commands).call