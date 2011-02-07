module ConfigLoader
  class MissingConfigFileError < RuntimeError
    def initialize(filename)
      super("The config file couldn't be found: #{filename}")
    end
  end
end