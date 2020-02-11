require 'rails_helper'

RSpec.feature "Item is added to cart", type: :feature, js: true do

    # SETUP
    before :each do
      # create the category in our database
      @category = Category.create! name: 'Apparel'

      # creates the product in our database
      @category.products.create!(
        name:  "Men's T-Shirt",
        description: "This is a men's t-shirt, for everyone",
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  
    scenario "They see all products on the homepage" do
      #  This is the homepage
      visit root_path

      # The cart should start as empty
      expect(page).to have_content "My Cart (0)", count: 1
      # save_and_open_screenshot


      # clicks 'add' to add the product to the cart
      click_button 'Add'

      # expects product page to display when clicked
      expect(page).to have_content "My Cart (1)", count: 1      
      # save_and_open_screenshot  
    end
      
      
end
