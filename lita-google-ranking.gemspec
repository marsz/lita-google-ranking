Gem::Specification.new do |spec|
  spec.name          = "lita-google-ranking"
  spec.version       = "2.0.1"
  spec.authors       = ["marsz"]
  spec.email         = ["marsz330@gmail.com"]
  spec.description   = "lita handler for scraping rank of google search results by domain with keyword"
  spec.summary       = "fetch keyword ranking on google search for a domain"
  spec.homepage      = "https://github.com/marsz/lita-google-ranking"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 4"
  spec.add_runtime_dependency "google-search", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rspec", "~> 3"

  spec.metadata = { "lita_plugin_type" => "handler" }
end
