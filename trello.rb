#!/usr/bin/env ruby
require 'bundler/inline'
gemfile do
  source 'https://rubygems.org'
  gem 'playwright-cli', require: 'playwright/cli'
end

require 'uri'

require_relative 'lib/version'
require_relative 'lib/set'
require_relative 'lib/open'
require_relative 'lib/url'

module Trello
  module CLI
    module Commands
      extend Playwright::CLI::Registry

      TRELLO_FILE = '.trello'.freeze

      register 'set',       Set,      aliases: ['s', 'set-url']
      register 'open',      Open,     aliases: ['o']
      register 'url',       Url,      aliases: ['cat', 'echo']
      register 'version',   Version,  aliases: ['v', '-v', '--version']

    end
  end
end

Playwright::CLI.new(Trello::CLI::Commands).call