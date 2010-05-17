dependencies = %w(missing_config_file_name_error missing_config_file_error map)
dependencies.each { |dependency| require "config_loader/#{dependency}" }

module ConfigLoader
  
  # Let's assume that you have the special file config/database.yml in your Rails project. In this example, you are using CouchDB as your database. This file has the content below:
  # 
  #     development:
  #       server: localhost
  #       port: 5984
  #       database_name: addressbook_development
  # 
  #     test:
  #       server: localhost
  #       port: 5984
  #       database_name: addressbook_development
  # 
  #     production:
  #       server: production.server.com
  #       port: 5984
  #       database_name: addressbook_development
  # 
  # In order to access the database configuration for your current environment, you'd write, for instance:
  # 
  #     db_config = ConfigLoader.load('database')
  #     db_config['server'] # localhost
  #     db_config[:server]  # localhost
  #     db_config.server    # localhost
  # 
  # We're assuming that your current environment is development.
  # 
  # You can get the configuration of a specific running environment writing this:
  # 
  #     db_config = ConfigLoader.load('database', 'production')
  #     db_config['server'] # production.server.com
  #     db_config[:server]  # production.server.com
  #     db_config.server    # production.server.com
  # 
  # Finally, you can specify the project root too. If you don't, it will assume the project root is RAILS_ROOT. To change it, write:
  # 
  # 
  #     db_config = ConfigLoader.load('database', 'production')
  #     db_config = ConfigLoader.load('database', 'test', '/home/user/my_special_project_root')  
  def self.load(file_name, running_env = Rails.env, project_root = RAILS_ROOT)
    ConfigLoader::Map.new(file_name, running_env, project_root).populate
  end
  
end
