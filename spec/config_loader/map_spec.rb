require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'yaml'

module ConfigLoader
  
  describe "Map" do
  
    before(:each) do
      Rails.stub!(:env).and_return('development')
      @config_loader = Map.new("database", 'development', '/home/user/project')
    end
  
    describe "initialize" do
      
      it "should raise appropriate exception when no config file name is given" do
        lambda { Map.new(nil, nil, nil) }.should raise_error(MissingConfigFileNameError)
      end

      it "should store the configuration file name" do
        @config_loader.file_name.should == 'database.yml'
      end

      it "should store the given running environment" do
        config_loader = Map.new("database", "production", '/home/user/project')
        config_loader.running_env.should == 'production'
      end
      
      it "should store the given project root" do
        config_loader = Map.new("database", "development", "/home/user/another_project")
        config_loader.project_root.should == "/home/user/another_project"
      end
      
    end
    
    describe ".full_file_name" do

      it "should return the full path of the configuration file name" do
        @config_loader.full_file_name.should == '/home/user/project/config/database.yml'
      end

    end
    
    describe ".file_content" do

      it "should load the contents of the YAML file" do
        file_mock = mock('File')
        File.should_receive(:exists?).with('/home/user/project/config/database.yml').and_return(true)
        File.should_receive(:open).with('/home/user/project/config/database.yml').and_yield(file_mock)
        YAML.should_receive(:load).with(file_mock).and_return({ 'development' => 'content'})
        @config_loader.file_content.should == { 'development' => 'content'}
      end
      
      it "should raise appropriate exception when the config file is not found" do
        File.should_receive(:exists?).with('/home/user/project/config/database.yml').and_return(false)
        lambda { @config_loader.file_content }.should raise_error(MissingConfigFileError)
      end

    end
    
    describe ".populate" do

      it "should load config for a specific running environment" do
        file_content = { 'development' => 
                            { 'server'        => 'localhost',
                              'port'          => 5984,
                              'name'          => 'customers' } }
        @config_loader.should_receive(:file_content).and_return(file_content)
        @config_loader.populate
        @config_loader['server'].should == 'localhost'
        @config_loader[:server].should  == 'localhost'
        @config_loader.server.should    == 'localhost'
        @config_loader['port'].should   == 5984
        @config_loader[:port].should    == 5984
        @config_loader.port.should      == 5984
        @config_loader['name'].should   == 'customers'
        @config_loader[:name].should    == 'customers'
        @config_loader.name.should      == 'customers'
      end

    end

  end

end