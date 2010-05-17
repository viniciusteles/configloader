require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ConfigLoader" do
  
  describe ".load" do
    
    def prepare_mocks(running_env, project_root)
      Rails.stub!(:env).and_return(running_env)
      ConfigLoader::Map.should_receive(:new).with('database', running_env, project_root).and_return(@map_mock)
      @map_mock.should_receive(:populate)
    end
    
    before(:each) do
      @map_mock = mock('ConfigLoader::Map')
    end
    
    it "should delegate to ConfigLoader::Map.populate" do
      prepare_mocks('development', '/home/user/project')      
      ConfigLoader.load('database').should == @map_mock
    end
    
    it "should delegate to ConfigLoader::Map.populate with the given running_env" do
      prepare_mocks('production', '/home/user/project')      
      ConfigLoader.load('database', 'production').should == @map_mock
    end

    it "should delegate to ConfigLoader::Map.populate with the given project_root" do
      prepare_mocks('development', '/home/user/another_project')      
      ConfigLoader.load('database', 'development', '/home/user/another_project').should == @map_mock
    end

  end

end
