module ConfigLoader

  class MissingConfigFileError < RuntimeError

    def initialize
      super("The config file couldn't be found.")
    end

  end

end