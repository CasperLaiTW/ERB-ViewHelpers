
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
        # tmp[key] = nil
        # log(self.breadcurmb_route(value, [key]))
        tmp.merge!(self.breadcurmb_route(value, [key]))
      end
      @path = tmp
    end

    # recursive run to all route path.
    def breadcurmb_route breadcrumb, parent
      tmp = {}
      # if the final item, creating hash. hash's key is final item. value is its path.
      # if breadcrumb.kind_of? String
      #   log("******string*****")
      #   log({breadcrumb => parent})
      #   return {breadcrumb => parent}
      # end

      # if item is array, it's final group. they have same path.
      # if breadcrumb.kind_of? Array
        # breadcrumb.each do |value|
          # tmp.merge!(self.breadcurmb_route(value, parent))
        # end
        # return tmp
      # end
      # log(breadcrumb)
      # recursive the path.
      breadcrumb.each do |key, value|

        if value.length > 0
          # log(key)
          # log(value)
          # tmp_parent = parent
          # add hold path.
          tmp.merge!({key => parent})
          # tmp_parent.concat([key])
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