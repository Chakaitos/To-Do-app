require 'spec_helper'

describe "Viewing todo items" do
	let!(:todo_list) { TodoList.create(title: "Grocery list", 
																		 description: "Groceries") }

	before do
		visit "/todo_lists"
		within "#todo_list_#{todo_list.id}" do
			click_link "List Items"
		end
	end

	it "should display the title of the todo list" do
		within("h1") do
			expect(page).to have_content(todo_list.title)
		end
	end

	it "should display no items when a todo list is empty" do
		expect(page).to have_content("TodoItems#index")
	end
end