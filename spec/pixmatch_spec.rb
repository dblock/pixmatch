require 'yaml'

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Pixmatch" do
  before(:each) do
    Pixmatch.configure do |config|
      pixmatch_yml = File.join(File.dirname(__FILE__), '../config/pixmatch.yml')
      pixmatch_yml = File.join(File.dirname(__FILE__), '../config/pixmatch.yml.default') if ! File.exists?(pixmatch_yml)
      raise "missing config/pixmatch.yml" if ! File.exists?(pixmatch_yml) 
      pixmatch_config = YAML.load_file(pixmatch_yml)['test']
      config.username = pixmatch_config['username']
      config.password = pixmatch_config['password']
      config.endpoint = pixmatch_config['endpoint']
    end
  end
  describe "methods" do
    it "ping" do
      response = Pixmatch.ping()
      response['status'].should == "ok"
      response['method'].should == "ping"
    end
    it "count" do
      count = Pixmatch.count()
      count.is_a?(Integer).should be_true
      count.should >= 0
    end
    it "add with one path" do
      response = Pixmatch.add(File.join(File.dirname(__FILE__), 'assets/mona-lisa.jpg'))
      response['status'].should == "ok"
      response['method'].should == "add"
    end
    it "add with one path as an array" do
      response = Pixmatch.add([ File.join(File.dirname(__FILE__), 'assets/mona-lisa.jpg') ])
      response['status'].should == "ok"
      response['method'].should == "add"
    end
    it "add with one File object" do
      response = Pixmatch.add(File.new(File.join(File.dirname(__FILE__), 'assets/mona-lisa.jpg')))
      response['status'].should == "ok"
      response['method'].should == "add"
    end
    it "add with one File object as an array" do
      response = Pixmatch.add([ File.new(File.join(File.dirname(__FILE__), 'assets/mona-lisa.jpg')) ])
      response['status'].should == "ok"
      response['method'].should == "add"
    end
    it "add with an array of File objects" do      
      response = Pixmatch.add(Dir.glob(File.join(File.dirname(__FILE__), 'assets/*.jpg')))
      response['status'].should == "ok"
      response['method'].should == "add"
    end
    it "list" do
      result = Pixmatch.list()
      result.is_a?(Array).should be_true
      result.size.should >= 0
    end
    it "delete with one name" do
      Pixmatch.add([ File.new(File.join(File.dirname(__FILE__), 'assets/mona-lisa.jpg')) ])
      count = Pixmatch.count
      response = Pixmatch.delete('mona-lisa.jpg')
      response['status'].should == "ok"
      response['method'].should == "delete"
      Pixmatch.count.should == count - 1
    end
    it "delete an array of names" do
      Pixmatch.add(Dir.glob(File.join(File.dirname(__FILE__), 'assets/*.jpg')))
      count = Pixmatch.count
      filenames = Dir.glob(File.join(File.dirname(__FILE__), 'assets/*.jpg')).map { |f| File.basename(f) }
      response = Pixmatch.delete(filenames)
      response['status'].should == "ok"
      response['method'].should == "delete"
      Pixmatch.count.should == count - filenames.size
    end
  end
end
