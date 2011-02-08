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
  #       database_name: addressbook_test
  # 
  #     production:
  #       server: production.server.com
  #       port: 5984
  #       database_name: addressbook_production
  # 
  # In order to access the database configuration for your current environment, you'd write, for instance:
  # 
  #     db_config = ConfigLoader.load('database')
  #     db_config['server']                     # localhost
  #     db_config['port']                       # 5984
  #     db_config['database_name']              # addressbook_development
  # 
  # We're assuming that your current environment is development.
  # 
  # You can get the configuration of a specific running environment writing this:
  # 
  #     db_config = ConfigLoader.load('database', 'production')
  #     db_config['server']                     # production.server.com
  #     db_config['port']                       # 5984
  #     db_config['database_name']              # addressbook_production
  # 
  # You can specify the project root too. If you don't, it will assume the project root is Rails.root. To change it, write:
  # 
  # 
  #     db_config = ConfigLoader.load('database', 'production')
  #     db_config = ConfigLoader.load('database', 'test', '/home/user/my_special_project_root')  
  #
  # Dinamic keys are also accepted. They're parsed using ERB. So, you're free to write a config file like this:
  #
  #     test:
  #       server: <%= `hostname` %>
  #       port: 5984
  #       database_name: addressbook_test
  def self.load(file_name, running_env = ENV['RAILS_ENV'], project_root = ENV['RAILS_ROOT'])
    ConfigLoader::Map.new(file_name, running_env, project_root).load
  end
end
