# CLI Controller
class Ebooks::CLI

  def call
    puts ''
    puts "BookBub"
    list_books
    menu
    goodbye
  end

  def list_books
    puts ''
    puts "today's eBooks:"
    puts ''
    @books = []
    @books = Ebooks::Books.scrape_books
    @books.each.with_index(1) do |book, i|
      binding.pry
      puts "#{i}. #{book.title} - #{book.author} - #{book.desc}"
      puts ''
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter number, exit, or list"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @books.count
        #binding.pry
        book = @books[input.to_i - 1]
        puts ''
        puts "#{book.title} - #{book.author} - #{book.desc}"
        puts ''
      elsif input == 'list'
        list_books
      elsif input != 'exit'
        puts ''
        puts "Not sure what you want..."
      end

    end #while
  end #menu

  def goodbye
    puts ''
    puts "See you later..."
    puts ''
  end

end #class
