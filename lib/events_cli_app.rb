require 'bundler/setup'
Bundler.require(:default, :development)

require_relative "./events_cli_app/version"
require_relative './events_cli_app/cli'
require_relative './events_cli_app/event'
require_relative './events_cli_app/tag'

require "irb"
require 'open-uri'
require 'nokogiri'
require 'pry'
