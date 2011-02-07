# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{configloader}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vinicius Teles"]
  s.date = %q{2011-02-07}
  s.description = %q{If you need to create a custom config file for you project, ConfigLoader will help you to load the contents of this file.}
  s.email = %q{vinicius@improveit.com.br}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".bundle/config",
     ".document",
     ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "configloader.gemspec",
     "lib/config_loader.rb",
     "lib/config_loader/map.rb",
     "lib/config_loader/missing_config_file_error.rb",
     "lib/config_loader/missing_config_file_name_error.rb",
     "lib/configloader.rb",
     "spec/alternative_root_dir/config/database.yml",
     "spec/config_loader_spec.rb",
     "spec/root_dir/config/database.yml",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/viniciusteles/configloader}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{ConfigLoader makes it easy to load the values of a custom configuration file in a Rails project.}
  s.test_files = [
    "spec/config_loader_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

