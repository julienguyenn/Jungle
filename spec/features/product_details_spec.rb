require 'rails_helper'

RSpec.feature "Visitor navigates to the product page", type: :feature, js: true do

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
      #  This is the act
      visit root_path

      click_link 'Details'

      # expects product page to display when clicked
     expect(page).to have_content "Apparel » Men's T-Shirt", count: 1

  
      # Takes a screenshot
      # save_and_open_screenshot
    end
    
    
end
