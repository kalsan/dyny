# frozen_string_literal: true

require 'bundler/gem_tasks'
require_relative 'lib/dyny/version'

task :gemspec do
  specification = Gem::Specification.new do |s|
    s.name = 'dyny'
    s.version = Dyny::Version::LABEL
    s.author = ['Sandro Kalbermatter']
    s.summary = 'A tiny framework for writing dynamic Rails views directly in Ruby'
    s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
    s.executables   = []
    s.require_paths = ['lib']
    s.required_ruby_version = '>= 3.0.0'
    s.license = 'LGPL-3.0-or-later'
    s.homepage = 'https://github.com/kalsan/dyny'
    s.metadata = {
      'source_code_uri'   => 'https://github.com/kalsan/dyny',
      'documentation_uri' => 'https://github.com/kalsan/dyny'

    }

    # Dependencies
    s.add_runtime_dependency 'rails' # Tested with Rails 7, but olders may work. TBD.
  end

  File.open('dyny.gemspec', 'w') do |f|
    f.puts('# DO NOT EDIT')
    f.puts("# This file is auto-generated via: 'rake gemspec'.\n\n")
    f.write(specification.to_ruby.strip)
  end
end
