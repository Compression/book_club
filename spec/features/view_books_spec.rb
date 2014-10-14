require "rails_helper"

feature "view books" do
  scenario "list books on index page" do
    books = FactoryGirl.create_list(:book, 5)

    visit books_path

    books.each do |book|
      expect(page).to have_content(book.title)
      expect(page).to have_content(book.author)
    end
  end
end
