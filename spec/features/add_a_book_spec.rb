require 'rails_helper'

feature 'submit book' do
  scenario 'user submits valid book' do

    visit "/books/new"

    fill_in "Title", with: "American History X"
    fill_in "Author", with: "Some Guy"
    fill_in "Year", with: "1996"
    fill_in "Description", with: "White guy hates black guys, goes to jail, likes them."
    fill_in "Category", with: "Fiction"
    click_button "Create Book"

    expect(page).to have_content("American History X")
    expect(page).to have_content("Some Guy")
    expect(page).to have_content("1996")
    expect(page).to have_content("White guy hates black guys, goes to jail, likes them.")
    expect(page).to have_content("Fiction")
  end

  scenario 'user submits invalid book' do

    visit "/books/new"

    fill_in "Title", with: ""
    fill_in "Author", with: ""
    fill_in "Year", with: ""
    fill_in "Description", with: ""
    fill_in "Category", with: ""
    click_button "Create Book"

    expect(Book.count).to eq(0)
  end
end
