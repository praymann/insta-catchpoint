require 'rubygems'
require 'thor'

module InstaCatchpoint
  class Runner < Thor    
    class_option :verbose, :type => :boolean
    
    desc "pull WEBSITE", "Pull down any tests for WEBSITE"
    def pull(website)
        Backend.new()
        Backend.create
        log("API Get tests for #{website}")
        Backend.get_tests(website)
    end
    desc "add WEBSITE", "Add default tests for WEBSITE"
    def add(website)
        Backend.load_config
        Backend.create
        log("API Add tests for #{website}")
        Backend.add
    end
    
    no_commands do
      def log(str)
        puts str if options[:verbose]
      end
    end
  end
end
