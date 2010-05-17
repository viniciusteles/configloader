module ConfigLoader
  
  class Map < Hash
    
    attr_reader :file_name, :running_env, :project_root

    def initialize(file_name, running_env, project_root)
      raise MissingConfigFileNameError unless file_name
      @file_name    = "#{file_name}.yml"
      @running_env  = running_env
      @project_root = project_root
    end
    
    def file_content
      raise MissingConfigFileError unless File.exists?(full_file_name)
      File.open(full_file_name) { |file| YAML::load(file) }
    end
    
    def full_file_name
      "#{project_root}/config/#{file_name}"
    end
    
    def populate
      file_content[@running_env].each do |key, value|
        self[key] = value
        self[key.to_sym] = value
      end
    end
    
    def method_missing(method_name)
      self[method_name]
    end

  end
  
end