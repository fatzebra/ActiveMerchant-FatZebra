# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "ActiveMerchant-FatZebra"
  s.version     = "1.0.1"
  s.authors     = ["Matthew Savage"]
  s.email       = ["matthew.savage@fatzebra.com.au"]
  s.homepage    = "https://www.fatzebra.com.au"
  s.summary     = %q{Fat Zebra support for Active Merchant, as a gem}
  s.description = %q{Fat Zebra support for Active Merchant - temporary gem until support is combined into active_merchant core.}

  s.rubyforge_project = "ActiveMerchant-FatZebra"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activemerchant"
  s.add_development_dependency "rake"
  s.add_development_dependency('mocha', '~> 0.11.3')
  s.add_development_dependency('rails', '>= 2.3.11')
end
