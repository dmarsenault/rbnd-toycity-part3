class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
    @price = options[:price]
    @stock = options[:stock]
  end

  def self.all
    @@products
  end

  def self.find_by_title(product_name)
    @@products.each do |product|
      if product.title == product_name
        return product
      end
    end
  end

  def self.in_stock
    in_stock = Array.new
    @@products.each do |product|
      unless product.stock <= 0
        in_stock << product
      end
    end
  return in_stock
  end

  def in_stock?
    if @stock.to_i > 0
      return true
    else
      return false
    end
  end

  def reduce_stock(amount)
    unless @stock == 0
      @stock -= amount
    else
      raise OutOfStockError
    end
  end


  private

  def add_to_products
    @@products.each do |product|
      if product.title == self.title
        raise DuplicateProductError, "'#{self.title}' already exists."
      end
    end
        @@products << self
  end

end
