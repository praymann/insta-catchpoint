module InstaCatchpoint
  class Backend
    def initialize
      conf = Configurator.load()
      @catchpoint = Api.new(conf)
    end
    def pull(website)
      @catchpoint.get("tests")["items"]
      # pp tests.select { |a| a["name"] == "WebC4 Random List Single Object" }
    end
    
    def add 
    
    end

    private
      def buildtest
        # build hash? of json objects to push to Catchpoint
        # One Object & One Emulated
      end

## Examples
# nodes = catchpoint.get("nodes")["items"]
# tests = catchpoint.get("tests")["items"]
  end
end
