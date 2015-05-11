module InstaCatchpoint
  class Backend
    def initialize
      @conf = Configurator.load()
      @catchpoint = Api.new(@conf)
    end
    def get_tests(website)
      puts @catchpoint.get("tests")["items"]
    end

## Examples
# nodes = catchpoint.get("nodes")["items"]
# tests = catchpoint.get("tests")["items"]
#
# pp tests.select { |a| a["name"] == "WebC4 Random List Single Object" }

  end
end
