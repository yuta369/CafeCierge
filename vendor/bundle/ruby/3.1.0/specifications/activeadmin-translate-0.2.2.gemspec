# -*- encoding: utf-8 -*-
# stub: activeadmin-translate 0.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "activeadmin-translate".freeze
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Kessler".freeze]
  s.date = "2012-11-16"
  s.description = "Translate your models in ActiveAdmin with Globalize3.".freeze
  s.email = ["michi@netzpiraten.ch".freeze]
  s.homepage = "https://github.com/netzpirat/activeadmin-translate".freeze
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Translate models with ActiveAdmin.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activeadmin>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<globalize3>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<railties>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activeadmin>.freeze, [">= 0"])
    s.add_dependency(%q<globalize3>.freeze, [">= 0"])
    s.add_dependency(%q<railties>.freeze, [">= 0"])
  end
end
