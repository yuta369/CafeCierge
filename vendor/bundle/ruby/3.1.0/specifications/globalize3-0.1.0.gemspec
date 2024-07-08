# -*- encoding: utf-8 -*-
# stub: globalize3 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "globalize3".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sven Fuchs".freeze, "Joshua Harvey".freeze, "Clemens Kofler".freeze, "John-Paul Bader".freeze]
  s.date = "2011-05-26"
  s.description = "Rails I18n: de-facto standard library for ActiveRecord 3 model/data translation.".freeze
  s.email = "nobody@globalize-rails.org".freeze
  s.homepage = "http://github.com/svenfuchs/globalize3".freeze
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Rails I18n: de-facto standard library for ActiveRecord 3 model/data translation".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
    s.add_runtime_dependency(%q<activemodel>.freeze, [">= 3.0.0"])
    s.add_development_dependency(%q<database_cleaner>.freeze, ["= 0.5.2"])
    s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_development_dependency(%q<pathname_local>.freeze, [">= 0"])
    s.add_development_dependency(%q<test_declarative>.freeze, [">= 0"])
    s.add_development_dependency(%q<ruby-debug19>.freeze, [">= 0"])
    s.add_development_dependency(%q<sqlite3-ruby>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<activemodel>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<database_cleaner>.freeze, ["= 0.5.2"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<pathname_local>.freeze, [">= 0"])
    s.add_dependency(%q<test_declarative>.freeze, [">= 0"])
    s.add_dependency(%q<ruby-debug19>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3-ruby>.freeze, [">= 0"])
  end
end
