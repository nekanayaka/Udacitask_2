class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  
  format_description(@description)
  
  format_date(due: @due)
  
  format_priority(@priority)
  
  details(@description)

end
