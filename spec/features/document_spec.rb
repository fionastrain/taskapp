require 'spec_helper'


describe Document do
  fixtures :users
  before do
    sign_in
  end

  it "require a name" do
     doc = Document.create
     doc.name = ""
     doc.docurl = "www"
     doc.should_not be_valid
    end

  it "require a url" do
    doc2 = Document.create
    doc2.name = "Doc Test"
    doc2.should_not be_valid
  end
end
