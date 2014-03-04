require "./helpers/helpers.rb"
require "./helpers/breadcrumb.rb"
# This method is base on fireapp docs example.
# The url will join {http_path} variable.
module ViewHelpers
  extend Helpers
  # load breadcrumb
  $breadcrumbs = Breadcrumb::Breadcurnbs.new File.expand_path('breadcrumbs.json')

  def new_link_to(name, href, options={})
    is_reference = $breadcrumbs.found_reference request.path, href
    href = ensure_path(href, '')
    if href == File.join(Helpers::Path.get_http_path, request.path) || is_reference
      options[:class] ||=''
      options[:class] += "active"
    end
    link_to name, href, options
  end

end





