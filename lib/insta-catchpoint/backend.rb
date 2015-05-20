require 'dish'

module InstaCatchpoint
  class Backend
   
    # Init method
    # Load all configurators then init a Catchpoint object
    def initialize
      conf = Configurator.load()
      @catchpoint = Api.new(conf)
    end
    
    # Search method, look for website
    def contains(website)
      test = pull(website)
      puts test
    end
    
    # Create a test for Catchpoint
    def create
      
    end
    
    # Dump all the tests in Catchpoint
    def dump(style)
      case style
        when 'human'
          pullall.each do |test|
            puts "Name: " + test.name
            puts "Status: " + test.status.name
            puts "Id: " + test.id.to_s
            puts "Type: " + test.type.name
            unless ( defined?(test.frequency.name) ).nil?
              puts "Frequency: " + test.frequency.name
            end
            puts "URL(s): " + test.test_url
            puts
          end
        when 'json'
          pullall.each do |test|
            puts test.to_json
            puts
          end
        when 'hash'
          pullall.each do |test|
            puts test.to_h
            puts
          end
        else
          puts "You're not supposed to be here. Didn't Runner catch the unregconized style?"
      end
    end
    
    # Private methods (not for use in Runner class)
    private
    
      # Method to return all tests in an array
      def pullall
        storage = Array.new
        @catchpoint.get("tests")["items"].each do |test|
          test = Dish(test)
          storage << Dish(test)
        end
        return storage
      end
      
      # Method to look for a url in any test in Catchpoint
      def pull_url(string)
        return Dish(@catchpoint.get("tests?url=#{string}"))
      end
      
      # Method to look for an id of a test in Catchpoint
      def pull_id(id)
        return Dish(@catchpoint.get("tests?id=#{id}"))
      end
      
      # Method to push something up to Catchpoint
      def push
        #@catchpoint.put(x)
      end
  end
end
