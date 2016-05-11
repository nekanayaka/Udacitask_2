class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
    
  end
  def add(type, description, options={})
    type = type.downcase
    if options[:priority] == "low" || options[:priority] == "medium" || options[:priority] == "high" || options[:priority] == nil
      # proceed.
    else
      raise UdaciListErrors::InvalidPriorityValue, "Invalid priority!"
    end
    
    if type == "todo" || type == "event" || type == "link"
      @items.push TodoItem.new(description, options) if type == "todo"
      @items.push EventItem.new(description, options) if type == "event"
      @items.push LinkItem.new(description, options) if type == "link"
    else
      raise UdaciListErrors::InvalidItemType, "Invalid item"
    end
    
  end
  def delete(index)
    if (index - 1) < @items.length
      @items.delete_at(index - 1)
    else
      raise UdaciListErrors::IndexExceedsListSize, "Index exceeds the list size!"
    end
  end
  def all
    if @title == nil
      @title = "Untitled list"
      puts "-" * @title.length
      puts @title
      puts "-" * @title.length
    end
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
