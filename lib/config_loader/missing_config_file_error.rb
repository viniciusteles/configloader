module ConfigLoader
  class MissingConfigFileError < RuntimeError
    def initialize(filename)
      message = [ "The config file couldn't be found: #{filename}",
                  "ENV['RAILS_ENV'] = '#{ENV["RAILS_ENV"]}'",
                  "ENV['RACK_ENV'] = '#{ENV["RACK_ENV"]}'",
                  "ENV['RAILS_ROOT'] = '#{ENV["RAILS_ROOT"]}'" ]
            
      super(message.join("\n"))
    end
  end
end