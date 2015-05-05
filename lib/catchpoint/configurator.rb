require 'yaml'

DEFAULT_FILE = ENV['HOME'] + '/.catchpoint'

###
# option:  default   :: description
# ------------------------------------
# "file":  undefined :: config file to be used, default is
#                      '$HOME/.catchpoint'
# "[opt]": n/a       :: set or overide [opt]
#
# Example:
#
#   require 'maxconf'
#
#   conf = MaxConf.load()
#   puts conf["alias"]
#   => YOUR_ALIAS
#
#   conf = MaxConf.load("/path/to/catchpoint")
#   puts conf["alias"]
#   => YOUR_ALIAS
#
#   opts = {
#     "file" => "/path/to/catchpoint",
#     "alias" => "ALIAS_OVERIDE"
#   }
#   conf = MaxConf.load(opts)
#   puts conf["alias"]
#   => ALIAS_OVERIDE
###
module Configurator
  def self.load opts={}
    if opts.class == String
      opts = { "file" => opts }
    end

    file = opts.delete("file") || opts.delete(:file) || DEFAULT_FILE
    conf = YAML.load_file(file)

    # overide config with passed options
    opts.each do |key, val|
      conf[key] = val
    end

    return conf
  end
end
