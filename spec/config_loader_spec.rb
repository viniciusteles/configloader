require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ConfigLoader" do
  describe ".load" do
    def prepare_mocks(running_env, project_root)
      Rails.stub!(:env).and_return(running_env)
      Rails.stub!(:root).and_return('/home/user/project')
      ConfigLoader::Map.should_receive(:new).with('database', running_env, project_root).and_return(@map_mock)
      @map_mock.should_receive(:load).and_return('config')
    end
    
    before(:each) do
      @map_mock = mock('ConfigLoader::Map')
    end
    
    it "should delegate to ConfigLoader::Map.populate" do
      prepare_mocks('development', '/home/user/project')      
      ConfigLoader.load('database').should == 'config'
    end
    
    it "should delegate to ConfigLoader::Map.populate with the given running_env" do
      prepare_mocks('production', '/home/user/project')      
      ConfigLoader.load('database', 'production').should == 'config'
    end

    it "should delegate to ConfigLoader::Map.populate with the given project_root" do
      prepare_mocks('development', '/home/user/another_project')      
      ConfigLoader.load('database', 'development', '/home/user/another_project').should == 'config'
    end
  end
  
  describe ".load (dynamically)" do
    it "should use ERB" do
      config = ConfigLoader.load('database', 'test', File.dirname(__FILE__))
      config['name'].should == 'customers'
    end
  end
end
