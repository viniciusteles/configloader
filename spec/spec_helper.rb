$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'configloader'
require 'spec'
require 'spec/autorun'

ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] = File.expand_path(File.join(File.dirname(__FILE__), "..", "spec", "root_dir"))
