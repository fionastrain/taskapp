require 'spec_helper'


describe Document do
  fixtures :users
  before do
    sign_in
  end

  it "require a name" do
     doc = Document.create
     doc.name = ""
     doc.should_not be_valid
   end
end
