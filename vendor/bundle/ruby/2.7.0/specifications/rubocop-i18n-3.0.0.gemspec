# -*- encoding: utf-8 -*-
# stub: rubocop-i18n 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-i18n".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet".freeze, "Brandon High".freeze, "TP Honey".freeze, "Helen Campbell".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-12-14"
  s.description = "RuboCop rules for detecting and autocorrecting undecorated strings for i18n (gettext and rails-i18n)".freeze
  s.email = ["team-modules@puppet.com".freeze, "brandon.high@puppet.com".freeze, "tp@puppet.com".freeze, "helen@puppet.com".freeze]
  s.homepage = "https://github.com/puppetlabs/rubocop-i18n".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.8".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "RuboCop rules for i18n".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<bundler>.freeze, [">= 1.17.3"])
  s.add_development_dependency(%q<pry>.freeze, ["~> 0.13.1"])
  s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
  s.add_development_dependency(%q<rb-readline>.freeze, ["~> 0.5.5"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_runtime_dependency(%q<rubocop>.freeze, ["~> 1.0"])
end
