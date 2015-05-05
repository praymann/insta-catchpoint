#!/usr/bin/env ruby

require 'rubygems'
require 'optparse'

require_relative 'configurator'
require_relative 'catchpoint'

# Arguments for CLI
options = {}
OptionParser.new do |opts|
  # Banner
  opts.banner = "Usage: loadtest.rb [options] -d directory -h host -p partner"
  # Options
  opts.on('-h', '--host HOST',String,'FTP hostname' ) do |h|
    options["host"] = h
  end
  opts.on('-d', '--dir DIR',String,'Directory of xml files' ) do |d|
    options["dir"] = d.chomp('/') << "/*.xml"
  end
  opts.on('-p', '--part PARTNERID',String,'Three letter ID of partner' ) do |p|
    options["partner"] = p
  end
  opts.on('--help', 'Help menu') do
    puts opts
  end
end.parse!

# Raise error if host, dir, and partner are NOT set
raise OptionParser::MissingArgument if options["host"].nil?
raise OptionParser::MissingArgument if options["dir"].nil?
raise OptionParser::MissingArgument if options["partner"].nil?
