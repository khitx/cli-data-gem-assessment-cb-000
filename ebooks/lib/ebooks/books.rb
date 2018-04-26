class Ebooks::Books
  attr_accessor :title, :author, :desc

  def self.scrape_books
    books = []
    books << self.scrape_BookBub
    books
  end

  def self.scrape_BookBubxxx
    doc = Nokogiri::HTML(open("https://www.bookbub.com/ebook-deals/free-ebooks"))
    book = self.new
    book.title = doc.search("div.book-title a").first.text.strip
    book.author = doc.search("small.book-author a").first.text.strip
    book.desc = doc.search("p.blurb").first.text.strip
    book
  end

  def self.scrape_BookBub
    doc = Nokogiri::HTML(open("https://www.bookbub.com/ebook-deals/free-ebooks"))
    books = []
    doc.css("div.book-panel").each do |book|
      book = self.new
      book.title = doc.search("div.book-title a").text.strip
      book.author = doc.search("small.book-author a").text.strip
      book.desc = doc.search("p.blurb").text.strip
    end
    books
  end

end
