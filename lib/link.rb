class LinkItem
  include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end
  
  format_description(@description)
  
  format_name(@site_name)
  
  details(@description)
end
