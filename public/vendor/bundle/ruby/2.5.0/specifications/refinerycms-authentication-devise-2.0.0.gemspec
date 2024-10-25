# -*- encoding: utf-8 -*-
# stub: refinerycms-authentication-devise 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "refinerycms-authentication-devise".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Philip Arndt".freeze, "Brice Sanchez".freeze, "Rob Yurkowski".freeze]
  s.date = "2017-09-14"
  s.description = "A Devise authentication extension for Refinery CMS".freeze
  s.homepage = "http://refinerycms.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Devise based authentication extension for Refinery CMS".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<refinerycms-core>.freeze, ["< 5.0", ">= 3.0.0"])
      s.add_runtime_dependency(%q<actionmailer>.freeze, ["< 5.2", ">= 5.0.0"])
      s.add_runtime_dependency(%q<devise>.freeze, [">= 4.3.0", "~> 4.0"])
      s.add_runtime_dependency(%q<friendly_id>.freeze, ["~> 5.2.1"])
    else
      s.add_dependency(%q<refinerycms-core>.freeze, ["< 5.0", ">= 3.0.0"])
      s.add_dependency(%q<actionmailer>.freeze, ["< 5.2", ">= 5.0.0"])
      s.add_dependency(%q<devise>.freeze, [">= 4.3.0", "~> 4.0"])
      s.add_dependency(%q<friendly_id>.freeze, ["~> 5.2.1"])
    end
  else
    s.add_dependency(%q<refinerycms-core>.freeze, ["< 5.0", ">= 3.0.0"])
    s.add_dependency(%q<actionmailer>.freeze, ["< 5.2", ">= 5.0.0"])
    s.add_dependency(%q<devise>.freeze, [">= 4.3.0", "~> 4.0"])
    s.add_dependency(%q<friendly_id>.freeze, ["~> 5.2.1"])
  end
end
