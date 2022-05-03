class BaseView
  def display(elements)
    elements.each do |element|
      puts "#{element.id} #{element.name} #{element.price}USD"
    end
  end

  def ask_for_integer(message)
    puts message.capitalize.to_s
    print '>'
    gets.chomp.to_i
  end

  def ask_for_string(message)
    puts message.capitalize.to_s
    print '>'
    gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    gets.chomp.to_i - 1
  end

  def confirm(element)
    puts "Was added: #{element.id}. #{element.name} #{element.price}"
  end
end
