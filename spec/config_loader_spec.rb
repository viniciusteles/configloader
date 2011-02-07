require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ConfigLoader" do
  before(:each) do
    @root_dir = File.expand_path(File.join(File.dirname(__FILE__), "..", "spec", "root_dir"))
    Rails.stub!(:root).and_return(@root_dir)
    Rails.stub!(:env).and_return('development')
  end

  describe ".load" do    
    it "raises exception when no config file name is given" do
      lambda { ConfigLoader.load(nil) }.should raise_error(ConfigLoader::MissingConfigFileNameError)
    end
    
    it "raises exception when the config file can't be found" do
      lambda { ConfigLoader.load('database', 'development', 'invalid_location') }.should raise_error(ConfigLoader::MissingConfigFileError)
    end
    
    it "loads keys for Rails.env from the config file located in Rails.root/config" do
      ConfigLoader.load('database')['name'].should == 'customers_development'
    end
    
    it "loads keys for the given environament from the config file located in Rails.root/config" do
      ConfigLoader.load('database', 'test')['name'].should == 'customers_test'
    end

    it "loads keys for the given environmanent from the config file located under the given directory/config" do
      alternative_root_dir = File.expand_path(File.join(File.dirname(__FILE__), "..", "spec", "alternative_root_dir"))
      ConfigLoader.load('database', 'development', alternative_root_dir)['name'].should == 'alternative_customers_development'
    end

    it "loads dinamic keys" do
      # KEY:
      #   name: <%= "CUSTOMERS".downcase %>_test
      config = ConfigLoader.load('database', 'test')
      config['name'].should == 'customers_test'
    end
  end
end
