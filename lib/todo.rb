# require 'chronic'
class TodoItem
  # include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    # @due = options[:due] ? Time.new.inspect.split[0].parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  def format_description
    "#{@description}".ljust(25)
  end
  def format_date
    @due ? @due.strftime("%D") : "No due date"
  end
  def format_priority
    value = " ⇧".colorize(:green) if @priority == "high"
    value = " ⇨" .colorize(:blue) if @priority == "medium"
    value = " ⇩".colorize(:red)  if @priority == "low"
    value = "" if !@priority
    return value
  end
  def details
    format_description + "due: " +
    format_date +
    format_priority
  end
end
