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

  def filter(type)
    event_items = []
    link_item = []
    todo_item = []
    
    for item in @items
      if type == "event" && item.is_a?(EventItem)
        event_items.push(item)
      # else
        # @items.delete(item)
      elsif type == "todo" && item.is_a?(TodoItem)
        todo_item.push(item)
      elsif type == "link" && item.is_a?(LinkItem)
        link_item.push(item)
      end
    end
    puts
    for item in event_items
      puts item.details
    end
    for item in link_item
      puts item.details
    end
    for item in todo_item
      puts item.details
    end
  end
  
  def set_priority(item_description, new_priority)
    for item in @items
      if item.description == item_description && item.is_a?(TodoItem)
        item.priority = new_priority
      end
    end
  end

  def all
    if @title == nil
      @title = "Untitled list"
    else
      # do nothing
    end
    artii_title = Artii::Base.new
    # artii_title = artii_obj.asciify()
    puts "-" * @title.length # artii_title.asciify(@title).length
    # puts @title
    puts artii_title.asciify(@title)
    puts "-" * @title.length # artii_title.asciify(@title).length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
