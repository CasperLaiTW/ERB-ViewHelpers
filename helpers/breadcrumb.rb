
module Breadcrumb
  class Breadcurnbs
    # init
    def initialize file
      @breadcrumb_file = file
      self.load_breadcrumbs
    end
    # load breadcrumb file
    def load_breadcrumbs
      json = JSON.parse(IO.read(@breadcrumb_file))
      tmp = {}
      json.each do |key, value|

        tmp.merge!(self.breadcurmb_route(value, [key]))
      end
      @path = tmp
    end

    # recursive run to all route path.
    def breadcurmb_route breadcrumb, parent
      tmp = {}

      # recursive the path.
      breadcrumb.each do |key, value|

        if value.length > 0
          # add hold path.
          tmp.merge!({key => parent})
          tmp.merge!(self.breadcurmb_route(value, parent + [key]))
        else
          # log(parent)
          tmp.merge!({key => parent})
        end
        
      end
      # log(tmp)
      return tmp
    end

    # found reference
    def found_reference request_path, href
      return @path[request_path].include?('/' + href)
    end
  end
end