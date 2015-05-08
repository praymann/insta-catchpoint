#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'pp'

conf       = Configurator.load()
catchpoint = Catchpoint.new(conf)

## Examples
# nodes = catchpoint.get("nodes")["items"]
# tests = catchpoint.get("tests")["items"]
#
# pp tests.select { |a| a["name"] == "WebC4 Random List Single Object" }



