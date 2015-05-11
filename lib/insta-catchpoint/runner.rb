require 'rubygems'
require 'thor'

module InstaCatchpoint
  class Runner < Thor    
    class_option :verbose, :type => :boolean
    
    desc "pull WEBSITE", "Pull down any tests for WEBSITE"
    def pull(website)
        this = Backend.new()
        log("API Get tests for #{website}")
        this.get_tests(website)
    end
    desc "add WEBSITE", "Add default tests for WEBSITE"
    def add(website)
        this = Backend.new()
        log("API Add tests for #{website}")
        this.add(website)
    end
    
    no_commands do
      def log(str)
        puts str if options[:verbose]
      end
    end
  end
end
