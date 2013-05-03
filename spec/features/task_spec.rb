require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'

describe Task do
  fixtures  :users
  before do
    sign_in
  end
  before(:each) do
    @task1 = Task.new(name: "me", description: "this is a test")
  end
  it "require task name" do
    tsk = Task.create
    tsk.should_not be_valid
    tsk.name="task1"
    tsk.project_id="1"
    tsk.should be_valid
  end

  it "require project" do
    tsk = Task.create
    tsk.should_not be_valid
    tsk.name="task1"
    tsk.should_not be_valid
    tsk.project_id="1"
    tsk.should be_valid
  end

  describe "should no dup" do
    before do
      duptask = Task.new(name: "me")
    end
    it {should_not be_valid}
  end


  it "description less than 50 chars" do
    tsk3 = Task.create
    tsk3.name="task"
    tsk3.description="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    tsk3.should_not be_valid
  end

  describe 'Adding a task' do
    it 'requires a name', :js => true do
      visit tasks_path
      click_link_or_button('New')
      fill_in "Description", with: "this is a test"
      click_button "Create Task"

      error_message = "Name can't be blank"
      page.should have_content(error_message)

    end
  end

  describe 'Adding a duplicate task' do
    it 'cant be duplicate', :js => true do
      visit projects_path
      click_link_or_button('New')
      fill_in "Name", with: "ProjectTest"
      click_button "Create Project"
      visit tasks_path
      click_link_or_button('New')
      fill_in "Name", with: "TaskTest"
      click_button "Create Task"
      visit tasks_path
      click_link "New"
      fill_in "Name", with: "TaskTest"
      click_button "Create Task"
      error_message = "Name only one task with same name"
      page.should have_content(error_message)
    end
  end



end