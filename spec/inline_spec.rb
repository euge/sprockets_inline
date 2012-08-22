require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SprocketsInline" do
  
  before :all do
    @env = Sprockets::Environment.new
    @env.append_path File.dirname(__FILE__) + "/js"
    @env.register_processor('application/javascript', SprocketsInline::Processor)
  end
  
  it "should inline JS files" do
    @env["basic.js"].to_s.should == "// Comment\nA;\nB;\nC;\n"
  end
  
  it "should preserve indenting" do
    @env["indent.js"].to_s.should == "  C;\n"
  end
end
