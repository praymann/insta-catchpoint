require 'dish'

module InstaCatchpoint
  class Backend
   
    # Init method
    # Load all configurators then init a Catchpoint object
    def initialize
      conf = Configurator.load()
      @catchpoint = Api.new(conf)
    end
    
    # Search method, look for website in test_url, by id, etc.
    def contains(string, style)
      if !/\A\d+\z/.match(string)
        # Not a positive number, url?
      else
        # Number
        test = pull_id(string)
      end
      case style
        when 'human'
            print_human(test)
        when 'json'
            print_json(test)
        when 'hash'
            print_hash(test)
        else
          puts "You're not supposed to be here. Didn't Runner catch the unregcongized style?"
      end
    end
    
    # Create a test for Catchpoint
    def create
      
    end
    
    # Dump all the tests in Catchpoint
    def dump(style)
      case style
        when 'human'
          pull_all.each do |test|
            print_human(test)
          end
        when 'json'
          pull_all.each do |test|
            print_json(test)
          end
        when 'hash'
          pull_all.each do |test|
            print_hash(test)
          end
        else
          puts "You're not supposed to be here. Didn't Runner catch the unregcongized style?"
      end
    end
    
    # Private methods (not for use in Runner class)
    private
    
      # Method to return all tests in an array
      def pull_all
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
        return Dish(@catchpoint.get("tests/#{id}"))
      end
      
      # Method to push something up to Catchpoint
      def push_test
        #@catchpoint.put(x)
      end
      
      def print_human(test)
        puts "Name: " + test.name
        unless ( defined?(test.description) ).nil?
          puts "Desc: " + test.description
        end
        puts "Status: " + test.status.name
        puts "Id: " + test.id.to_s
        unless ( defined?(test.type.name) ).nil?
          puts "Type: " + test.type.name
        end
        unless ( defined?(test.test_type.name) ).nil?
          puts "Type: " + test.test_type.name
        end
        unless ( defined?(test.monitors['name']) ).nil?
          string = "Monitor(s): "
          test.monitors.each do |monitor|
            string += monitor.name + ' '
          end
          puts string              
        end
        unless ( defined?(test.monitor.name) ).nil?
          puts "Monitor: " + test.monitor.name
        end
        unless ( defined?(test.http_method.name) ).nil?
          puts "HTTP: " + test.http_method.name.upcase + " request"
        end
        unless ( defined?(test.frequency.name) ).nil?
           puts "Frequency: " + test.frequency.name
        end
        unless ( defined?(test.advanced_settings) ).nil?
          puts "Advanced Settings:"
          test.advanced_settings.to_h.each do |key, value|
            puts "  " + key.capitalize + ": "
            if value.is_a?(Hash)
              value.each do |key, value|
                if value.is_a?(Hash)
                  puts "    " + key.capitalize + ' = ' + value['name']
                else
                  puts "    " + key.capitalize + ' = ' + value.to_s
                end
              end
            else
              puts value
            end
          end
        end
        puts "URL(s): " + test.test_url
        puts
      end
      
      def print_json(test)
        puts test.to_json
      end
      
      def print_hash(test)
        puts test.to_h
      end
  end
end
