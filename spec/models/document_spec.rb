require 'spec_helper'

describe Document do
   it "require a name" do
     doc = Document.create
     doc.name = ""
     doc.should_not be_valid
   end
end
