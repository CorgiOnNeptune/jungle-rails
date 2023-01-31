require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with a name, price, quantity and category_id' do
      @category = Category.find_by(id: 1)
      @product = Product.new(name: 'Name', price_cents: 1999, quantity: 4, category_id: @category[:id])

      expect(@product).to be_valid
    end

    describe '@name' do
      it 'is not valid without a name' do
        @category = Category.find_by(id: 1)
        @product = Product.new(name: nil, price_cents: 1999, quantity: 4, category_id: @category[:id])

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    describe '@price' do
      it 'is not valid without a price' do
        @category = Category.find_by(id: 1)
        @product = Product.new(name: 'Name', price_cents: nil, quantity: 4, category_id: @category[:id])

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    describe '@quantity' do
      it 'is not valid without a quantity' do
        @category = Category.find_by(id: 1)
        @product = Product.new(name: 'Name', price_cents: 1999, quantity: nil, category_id: @category[:id])

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    describe '@category' do
      it 'is not valid without a category' do
        @category = Category.find_by(id: 1)
        @product = Product.new(name: 'Name', price_cents: 1999, quantity: 4, category_id: nil)

        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
