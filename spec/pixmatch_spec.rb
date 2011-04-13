require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Pixmatch" do
  before(:each) do
    Pixmatch.configure do |config|
      config.username = "username"
      config.password = "password"
      config.endpoint = "http://<yourserverhere>.tineye.com"
    end
  end
  describe "methods" do
    it "ping" do
      response = Pixmatch.ping()
      response['status'].should == "ok"
      response['method'].should == "ping"
    end
  end
end
