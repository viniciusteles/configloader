$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'configloader'
require 'spec'
require 'spec/autorun'

RAILS_ROOT = '/home/user/project'

class Rails
end


Spec::Runner.configure do |config|
end
