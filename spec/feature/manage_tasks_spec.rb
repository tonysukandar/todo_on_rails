require 'rails_helper'

feature 'Manage tasks', js: true do
  scenario 'add a new task' do
    # Point your browser towards the todo path
    visit todos_path
    fill_in 'todo_title', with: 'Be Batman'
    page.execute_script("$('form').submit()")
    sleep(10)

    # Expect the new task to be displayed in the list of tasks
    expect(page).to have_content('Be Batman')
  end

  scenario 'counter changes' do
    visit todos_path
    fill_in 'todo_title', with: 'Eat a cheese burger'
    page.execute_script("$('form').submit()")

    # Wait for 1 second so the counter can be updated
    sleep(3)

    expect( page.find(:css, 'span#todo-count').text ).to eq "1"
    # expect( page.find(:css, 'span#todo-count').text ).to eq "1"
    # expect( page.find(:css, 'span#todo-count').text ).to eq "1"
  end

  scenario 'complete a task' do
    visit todos_path
    fill_in 'todo_title', with: 'go to candy mountain'
    page.execute_script("$('form').submit()")

    check('todo-1')

    # Wait for 1 second so the counter can be updated
    sleep(5)

    expect( page.find(:css, 'span#todo-count').text ).to eq "0"
  end


end
