class TodoItem
  include Listable
  attr_reader :type, :description, :due
  attr_accessor :priority

  def initialize(type, description, options={})
    @type = type
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  def details
    "#{format_type(@type)}#{format_description(@description)} due: #{format_date(due: @due)} #{format_priority(@priority)}"
  end
end
