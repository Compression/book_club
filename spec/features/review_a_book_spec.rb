require "rails_helper"

feature "new review" do
  before :each do
    @book = FactoryGirl.create(:book)
  end

  scenario "user creates a review" do
    visit new_book_review_path(@book)

    fill_in "Write a review", with: "I absolutely LOVE this book"
    click_button "Create Review"

    expect(page).to have_content("I absolutely LOVE this book")
  end

  scenario "user submits an empty form" do
    visit new_book_review_path(@book)

    fill_in "Write a review", with: ""
    click_button "Create Review"

    expect(page).to have_content("fael review lol, try again wow")
  end
end
