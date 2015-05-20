require 'rubygems'
require 'thor'

module InstaCatchpoint
  class Runner < Thor    
    class_option :verbose, :type => :boolean
    class_option :force, :type => :boolean
    
    desc "pull WEBSITE", "Pull down any tests for WEBSITE"
    def pull(website)
        this = Backend.new
        log("API - Get tests for #{website}")
        #this.contains(website)
    end
    desc "pullall STYLE", "Pull down ALL tests in Catchpoint; output in json, hash, human"
    def pullall(style)
      style.chomp
      this = Backend.new
      puts "WARNING: This may take a while!"
      puts
      case style
        when 'human'
          this.dump(style)
        when 'json'
          this.dump(style)
        when 'hash'
          this.dump(style)
        else
          log("Requesting all tests in a data format of #{style}")
          puts "I don't reconigize that style of data..."
      end
    end
    desc "add WEBSITE", "Add default tests for WEBSITE"
    def add(website)
        this = Backend.new
        log("API - Add tests for #{website}")
        #this.create(website)
    end
    
    no_commands do
      def log(str)
        puts str if options[:verbose]
      end
    end
  end
end
