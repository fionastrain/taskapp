require 'spec_helper'

describe Teammate do
    before(:each) do
      @team1 = Teammate.new(name: "me", email: "me@me.com")
    end
    it "require name" do
      tmm = Teammate.new(email: "fiona@fiona.com")
      tmm.should_not be_valid
    end

    describe "should no dup" do
      before do
        dupteammate = Teammate.new(name: "me")
      end
      it {should_not be_valid}
    end


    it "email be valid" do
      tmm2 = Teammate.new(name: "fi", email:"mememe")
      tmm2.should_not be_valid
    end

    it "this email valid and it said not valid!" do
      tmm3 = Teammate.new(name: "fi dos", email:"real@real.com")
      tmm3.should be_valid
    end

    describe 'Adding a teammate' do
      it 'requires a name' do
        visit teammates_path
        click_link "New Teammate"
        fill_in "Email", with: "fiona.strain1@gmail.com"
        click_button "Create Teammate"

        error_message = "Name can't be blank"
        page.should have_content(error_message)

      end
    end


    describe 'Adding a duplicate teammate' do
      it 'cant be duplicate' do
        visit teammates_path
        click_link "New Teammate"
        fill_in "Name", with: "Fiona"
        fill_in "Email", with: "fiona.strain1@gmail.com"
        click_button "Create Teammate"
        visit teammates_path
        click_link "New Teammate"
        fill_in "Name", with: "Fiona"
        click_button "Create Teammate"
        error_message = "Name Teammate already exists"
        page.should have_content(error_message)
      end
    end

   describe 'Entering invalid email' do
     it 'cant be invalid' do
       visit teammates_path
       click_link "New Teammate"
       fill_in "Name", with: "Fake"
       fill_in "Email", with: "fakefake"
       click_button "Create Teammate"
       error_message = "Email is invalid"
       page.should have_content(error_message)
     end
   end

  end

