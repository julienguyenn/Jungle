require 'rails_helper'


RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should be valid when all attributes are filled' do
      @category = Category.create(:name => 'myCategory')
      @product=Product.new(name: 'julie', price:199, quantity: 2, category: @category)
      expect(@product).to be_valid
    end

    it 'should be assigned a name when creating a product' do
      @category = Category.create(:name => 'myCategory')
      @product=Product.new(name:nil, price:199, quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should be assigned a price when creating a product' do
      @category = Category.create(:name => 'myCategory')
      @product=Product.new(name:'hi', price:nil, quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should be assigned a quantity when creating a product' do
      @category = Category.create(:name => 'myCategory')
      @product=Product.new(name:'hi', price:199, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it 'should be assigned a quantity when creating a product' do
      @product=Product.new(name:'hi', price:199, quantity: nil, category: nil)
      expect(@product).to_not be_valid
    end
  end
end