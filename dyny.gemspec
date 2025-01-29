# DO NOT EDIT
# This file is auto-generated via: 'rake gemspec'.

# -*- encoding: utf-8 -*-
# stub: dyny 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "dyny".freeze
  s.version = "0.0.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "documentation_uri" => "https://github.com/kalsan/dyny", "source_code_uri" => "https://github.com/kalsan/dyny" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sandro Kalbermatter".freeze]
  s.date = "2025-01-29"
  s.files = [".gitignore".freeze, ".ruby-version".freeze, "CHANGELOG.md".freeze, "LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "VERSION".freeze, "dyny.gemspec".freeze, "lib/dyny.rb".freeze, "lib/dyny/helper.rb".freeze, "lib/dyny/railtie.rb".freeze, "lib/dyny/template_handler.rb".freeze, "lib/dyny/version.rb".freeze, "logo.svg".freeze]
  s.homepage = "https://github.com/kalsan/dyny".freeze
  s.licenses = ["LGPL-3.0-or-later".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.6.1".freeze
  s.summary = "A tiny framework for writing dynamic Rails views directly in Ruby".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rails>.freeze, [">= 0".freeze])
end