require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "the truth" do
    assert true
  end
  
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any? 
  end
  
  test "product price must be positive" do
    product = Product.new(:title  => "My book title",
                          :description => "skowpek",
                          :image_url => "sjweiow.jpg" )
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join('; ')
      
    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join('; ')
      
    product.price = 1
    assert product.valid?
  end
  
  test "product title must be longer than 10 characters" do
    product = Product.new(:title        => "rewi1",
                          :description  => "jreiowjr",
                          :image_url    => "jdiwrojeo.jpg",
                          :price        => 15)
                          
    assert product.invalid?
    assert_equal "must have minimum length equal to 10 characters",
      product.errors[:title].join('; ')
    
    product.title = "1234567890"
    assert product.valid?
                         
  end
  
end
