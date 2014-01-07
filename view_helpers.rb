# This method is base on fireapp docs example.
# The url will join {http_path} variable.
module ViewHelpers
  def new_link_to(name, href, options={})
    href = File.join(Helpers::Path.get_http_path, href)
    href = ensure_path(href, '')
    if href == File.join(Helper::Path.get_http_path, request.path)
      options[:class] ||=''
      options[:class] += "active"
    end
    link_to name, href, options
  end
end

# @authors Casper Lai (casper.lai@sleepingdesign.com)
# @date    2014-01-07 15:02:32
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
end
