require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'nesta/env'
require "coderay"
require "rack/codehighlighter"
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'
use Rack::Codehighlighter, :coderay, :element => "pre>code", :pattern => /\A:::(\w+)\s*\n/, :markdown => true
run Nesta::App
