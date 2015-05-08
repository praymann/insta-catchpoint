require 'rubygems'
require 'thor'
#require 'pp'

module InstaCatchpoint
  class Runner < Thor    
    class_option :verbose, :type => :boolean
    
    desc "pull WEBSITE", "Pull down any tests for WEBSITE"
    def pull(website)
        Backend.load_config
        Backend.create
        log("API Get tests for #{website}")
        Backend.get_tests
    end
    desc "add WEBSITE", "Add default tests for WEBSITE"
    def add(website)
        log("API Add tests for #{website}")
    end
    
    no_commands do
      def log(str)
        puts str if options[:verbose]
      end
    end
  end
  
  module Backend
    def self.load_config
      @conf = Configurator.load()
    end
    def self.create
      @catchpoint = Api.new(@conf)
    end
    def self.get_tests
      puts @catchpoint.get("tests")["items"]
    end

## Examples
# nodes = catchpoint.get("nodes")["items"]
# tests = catchpoint.get("tests")["items"]
#
# pp tests.select { |a| a["name"] == "WebC4 Random List Single Object" }

  end
end
