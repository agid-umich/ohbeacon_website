# -*- encoding: utf-8 -*-
# stub: capistrano3-puma 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano3-puma".freeze
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Abdelkader Boudih".freeze]
  s.date = "2015-08-20"
  s.description = "Puma integration for Capistrano 3".freeze
  s.email = ["Terminale@gmail.com".freeze]
  s.homepage = "https://github.com/seuros/capistrano-puma".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Puma integration for Capistrano".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<puma>.freeze, [">= 2.6"])
    else
      s.add_dependency(%q<capistrano>.freeze, ["~> 3.0"])
      s.add_dependency(%q<puma>.freeze, [">= 2.6"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, ["~> 3.0"])
    s.add_dependency(%q<puma>.freeze, [">= 2.6"])
  end
end
