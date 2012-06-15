# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ActiveMerchant-FatZebra/version"

Gem::Specification.new do |s|
  s.name        = "ActiveMerchant-FatZebra"
  s.version     = ActiveMerchant::FatZebra::VERSION
  s.authors     = ["Matthew Savage"]
  s.email       = ["matt@amasses.net"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "ActiveMerchant-FatZebra"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
