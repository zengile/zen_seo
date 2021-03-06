$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zen_seo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zen_seo"
  s.version     = ZenSeo::VERSION
  s.authors     = ["Serj Prikhodko"]
  s.email       = ["prikha@gmail.com"]
  s.homepage    = "http://github.com/zengile/zen_seo"
  s.summary     = 'Fancy way of forgetting about SEO issues.'

  s.files = `git ls-files`.split("\n")
  s.test_files = Dir["spec/**/*"]
  s.require_paths     = ["lib"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "meta-tags"

  s.description = <<-EOM
Seo is missed when talking about web apps. Zen_seo comes to bring justice to this cruel world.
  EOM

  s.post_install_message = <<-EOM
You are now on Zen promotion of zen_seo. Enjoy!
  EOM

end
