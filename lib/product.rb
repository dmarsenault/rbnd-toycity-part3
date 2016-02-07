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
