# @authors Casper Lai (casper.lai@sleepingdesign.com)
# @date    2014-02-07 15:02:32
# @version 1.0.0.0
module Helpers
  # the module get compass config {http_path} varitable.
  module Path
    def self.get_http_path
      if defined? Compass
          if defined? Compass.configuration.http_path
            Compass.configuration.http_path
          else
            ''
          end
        end
    end
  end

  module Debug
    def self.log message
      print("========debug:========\n")
      print(message)
      print("\n")
      print("========debug:========\n")
    end
  end
end