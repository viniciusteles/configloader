require 'erb'
require 'yaml'

module ConfigLoader
  class Map
    attr_reader :file_name, :running_env, :project_root

    def initialize(file_name, running_env, project_root)
      raise MissingConfigFileNameError unless file_name
      @file_name    = "#{file_name}.yml"
      @running_env  = running_env
      @project_root = project_root
    end
    
    def file_content
      raise MissingConfigFileError unless File.exists?(full_file_name)
      YAML.load(ERB.new(File.read(full_file_name)).result)
    end
    
    def full_file_name
      "#{project_root}/config/#{file_name}"
    end
    
    def load
      file_content[@running_env]
    end
    
    def method_missing(method_name)
      self[method_name]
    end
  end
end