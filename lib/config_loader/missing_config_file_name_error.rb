module ConfigLoader

  class MissingConfigFileNameError < ArgumentError
    
    def initialize
      super('You must provide a config file name.')
    end
    
  end

end