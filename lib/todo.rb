# require 'chronic'
class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    # @due = options[:due] ? Time.new.inspect.split[0].parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  
end
