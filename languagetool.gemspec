# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: languagetool 1.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "languagetool".freeze
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Herzog".freeze]
  s.date = "2025-02-04"
  s.description = "Gem wrapper for the LanguageTool API (public or private). It allows to correct texts.".freeze
  s.email = "info@danielherzog.es".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".github/workflows/test.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "languagetool.gemspec",
    "lib/languagetool.rb",
    "lib/languagetool/actions/base.rb",
    "lib/languagetool/actions/check.rb",
    "lib/languagetool/actions/languages.rb",
    "lib/languagetool/api.rb",
    "lib/languagetool/api_error.rb",
    "lib/languagetool/resources/context.rb",
    "lib/languagetool/resources/language.rb",
    "lib/languagetool/resources/languages.rb",
    "lib/languagetool/resources/match.rb",
    "lib/languagetool/resources/matches.rb",
    "lib/languagetool/resources/rule.rb",
    "lib/languagetool/resources/rule_category.rb",
    "lib/languagetool/resources/software.rb",
    "test/check_test.rb",
    "test/fixtures/vcr_cassettes/check.yml",
    "test/fixtures/vcr_cassettes/languages.yml",
    "test/languages_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = "https://github.com/wikiti/languagetool-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Gem wrapper for the LanguageTool API (public or private)".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_development_dependency(%q<rdoc>.freeze, [">= 4"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2"])
    s.add_development_dependency(%q<juwelier>.freeze, ["~> 2"])
  else
    s.add_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 4"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2"])
  end
end

