class Transaction
  attr_reader :customer, :product, :id

  @@transactions = Array.new

  @@id = 1

  def initialize(customer, product)
    @id = customer_id
    @customer = customer
    @product = product
    product.reduce_stock(1)
  end

  def self.all
    @@transactions
  end

  def customer_id
    @id = @@id
    @@id += 1
  end

end
