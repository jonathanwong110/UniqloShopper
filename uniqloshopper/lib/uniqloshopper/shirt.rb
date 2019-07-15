class UniqloShopper::Shirt

  attr_accessor :name, :price, :url
  
  @@all = []
  @@keyword = nil

  def initialize(name:, price:, url:)
    @name = name
    @price = price
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.keyword
    @@keyword
  end
  
  def self.reset_keyword
    @@keyword = nil
  end
  
  def self.print_shirts
    self.find_shirts.each.with_index do |shirt, i|
      puts "#{i+1}. #{shirt.name}"
    end
  end
  
  def self.selection(input)
    return self.find_shirts[input]
  end

  def self.find_shirts
    if @@keyword == nil
      return @@all
    end
    @@all.find_all { |shirt| shirt.name.upcase.include?(@@keyword.upcase) }
  end
  
  def self.find_if_keyword(keyword)
    @@keyword = keyword
    listed = @@all.find { |shirt| shirt.name.upcase.include?(@@keyword.upcase) }
    return listed
  end

end
