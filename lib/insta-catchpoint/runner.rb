require 'rubygems'
require 'thor'

module InstaCatchpoint
  class Runner < Thor    
    class_option :verbose, :type => :boolean
    
    desc "pull [IDENTIFIER] [STYLE]", "Pull test that matches/contains/is; output in json, hash, human"
    def pull(identifier, style)
      identifier.chomp
      style.chomp
      this = Backend.new
      log("Requesting test(s) that matches/contains/is: #{identifier}")
      case style
        when 'human'
          log("Requesting test(s) in a human readable format\n\n")
          this.contains(identifier, style)
        when 'json'
          log("Requesting test(s) in json format\n\n")
          this.contains(identifier, style)
        when 'hash'
          log("Requesting test(s) in hash format\n\n")
          this.contains(identifier, style)
        else
          log("Requesting all tests in a data format of #{style}\n\n")
          puts "I don't recongize that style of data..."
      end
    end
    
    desc "pullall [STYLE]", "Pull down ALL tests in Catchpoint; output in json, hash, human"
    def pullall(style)
      style.chomp
      this = Backend.new
      log("WARNING: This may take a while!")
      case style
        when 'human'
          log("Requesting all tests in a human readable format\n\n")
          this.dump(style)
        when 'json'
          log("Requesting all tests in json format\n\n")
          this.dump(style)
        when 'hash'
          log("Requesting all test in hash format\n\n")
          this.dump(style)
        else
          log("Requesting all tests in a data format of #{style}\n\n")
          puts "I don't recongize that style of data..."
      end
    end
    
    desc "add [WEBSITE]", "Add defined default tests for WEBSITE"
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
