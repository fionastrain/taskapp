require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'


describe Project do
  fixtures :users
  before do
    sign_in
  end

  it "require a name" do
    pro = Project.create
    pro.name = ""
    pro.should_not be_valid
  end
end