class Customer
  attr_reader :name

  @@customers = Array.new


  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(customer_name)
    @@customers.each do |customer|
      if customer.name == customer_name
        return customer
      else
        raise NoSuchCustomer "#{self.name} is not in our database."
      end
    end
  end

  def purchase(product)
    Transaction.new(self, product)
  end

  private

  def add_to_customers
    @@customers.each do |customer|
      if customer.name == self.name
        raise DuplicateCustomerError "'#{self.name}' already exists."
      end
    end
  @@customers << self
  end

end
