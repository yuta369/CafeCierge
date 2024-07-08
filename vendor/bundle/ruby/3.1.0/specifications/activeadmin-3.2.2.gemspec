# -*- encoding: utf-8 -*-
# stub: activeadmin 3.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "activeadmin".freeze
  s.version = "3.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/activeadmin/activeadmin/issues", "changelog_uri" => "https://github.com/activeadmin/activeadmin/blob/master/CHANGELOG.md", "documentation_uri" => "https://activeadmin.info", "homepage_uri" => "https://activeadmin.info", "mailing_list_uri" => "https://groups.google.com/group/activeadmin", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/activeadmin/activeadmin", "wiki_uri" => "https://github.com/activeadmin/activeadmin/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Charles Maresh".freeze, "David Rodr\u00EDguez".freeze, "Greg Bell".freeze, "Igor Fedoronchuk".freeze, "Javier Julio".freeze, "Piers C".freeze, "Sean Linsley".freeze, "Timo Schilling".freeze]
  s.date = "2024-05-31"
  s.description = "The administration framework for Ruby on Rails.".freeze
  s.email = ["deivid.rodriguez@riseup.net".freeze]
  s.extra_rdoc_files = ["CHANGELOG.md".freeze, "CODE_OF_CONDUCT.md".freeze, "CONTRIBUTING.md".freeze, "README.md".freeze]
  s.files = ["CHANGELOG.md".freeze, "CODE_OF_CONDUCT.md".freeze, "CONTRIBUTING.md".freeze, "README.md".freeze]
  s.homepage = "https://activeadmin.info".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Active Admin is a Ruby on Rails plugin for generating administration style interfaces. It abstracts common business application patterns to make it simple for developers to implement beautiful and elegant interfaces with very little effort.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<arbre>.freeze, ["~> 1.2", ">= 1.2.1"])
    s.add_runtime_dependency(%q<csv>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<formtastic>.freeze, [">= 3.1"])
    s.add_runtime_dependency(%q<formtastic_i18n>.freeze, [">= 0.4"])
    s.add_runtime_dependency(%q<inherited_resources>.freeze, ["~> 1.7"])
    s.add_runtime_dependency(%q<jquery-rails>.freeze, [">= 4.2"])
    s.add_runtime_dependency(%q<kaminari>.freeze, [">= 1.2.1"])
    s.add_runtime_dependency(%q<railties>.freeze, [">= 6.1"])
    s.add_runtime_dependency(%q<ransack>.freeze, [">= 4.0"])
  else
    s.add_dependency(%q<arbre>.freeze, ["~> 1.2", ">= 1.2.1"])
    s.add_dependency(%q<csv>.freeze, [">= 0"])
    s.add_dependency(%q<formtastic>.freeze, [">= 3.1"])
    s.add_dependency(%q<formtastic_i18n>.freeze, [">= 0.4"])
    s.add_dependency(%q<inherited_resources>.freeze, ["~> 1.7"])
    s.add_dependency(%q<jquery-rails>.freeze, [">= 4.2"])
    s.add_dependency(%q<kaminari>.freeze, [">= 1.2.1"])
    s.add_dependency(%q<railties>.freeze, [">= 6.1"])
    s.add_dependency(%q<ransack>.freeze, [">= 4.0"])
  end
end
