require "./helpers/breadcrumb.rb"
# This method is base on fireapp docs example.
# The url will join {http_path} variable.
module ViewHelpers

  # load breadcrumb
  $breadcrumbs = Breadcrumb::Breadcurnbs.new File.expand_path('breadcrumbs.json')

  def new_link_to(name, href, options={})
    is_reference = $breadcrumbs.found_reference request.path, href
    href = File.join(Helpers::Path.get_http_path, href)
    href = ensure_path(href, '')
    if href == File.join(Helpers::Path.get_http_path, request.path) || is_reference
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

  module Debug
    def self.log message
      print("========debug:========\n")
      print(message)
      print("\n")
      print("========debug:========\n")
    end
  end
end
