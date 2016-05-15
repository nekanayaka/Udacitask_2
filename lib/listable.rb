module Listable
  def format_description
    "#{@description}".ljust(25)
  end
  def format_date(options={})
    due = options[:due] if options[:due] != nill
    start_date = options[:start_date] if options[:start_date] != nill
    end_date = options[:end_date] if options[:end_date] != nill
    
    if start_date
      dates = @start_date.strftime("%D") if start_date
      dates << " -- " + @end_date.strftime("%D") if end_date
      dates = "N/A" if !dates
    else
      due ? @due.strftime("%D") : "No due date"
    end
    return dates
  end
  def details(description)
    if description == "event"
      format_description + "event dates: " + format_date
    elsif description == "link"
       format_description + "site name: " + format_name
    else
      format_description + "due: " +
      format_date +
      format_priority
    end
  end
  def format_name
    @site_name ? @site_name : ""
  end
  def format_priority
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨" .colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:green)  if @priority == "low"
    value = "" if !@priority
    return value
  end
end
