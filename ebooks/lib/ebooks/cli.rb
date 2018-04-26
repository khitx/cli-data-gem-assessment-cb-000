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
    @books = Ebooks::Books.scrape_books
    @books[0].each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} - #{book.author}"
      puts ''
    end
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter number, exit, or list"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @books[0].count
        book = @books[0][input.to_i - 1]
        puts ''
        puts "#{book.title}"
        puts "#{book.author}"
        puts "#{book.desc}"
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
