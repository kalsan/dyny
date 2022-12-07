# DO NOT EDIT
# This file is auto-generated via: 'rake gemspec'.

# -*- encoding: utf-8 -*-
# stub: dyny 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dyny".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sandro Kalbermatter".freeze]
  s.date = "2022-12-07"
  s.files = [".gitignore".freeze, ".ruby-version".freeze, "LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "dyny.gemspec".freeze, "lib/dyny.rb".freeze, "lib/dyny/helper.rb".freeze, "lib/dyny/railtie.rb".freeze, "lib/dyny/template_handler.rb".freeze, "lib/dyny/version.rb".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "A tiny framework for writing dynamic Rails views directly in Ruby".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 0"])
  end
end