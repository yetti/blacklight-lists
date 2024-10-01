# frozen_string_literal: true

require_relative "lib/blacklight_lists/version"

Gem::Specification.new do |spec|
  spec.name = "blacklight_lists"
  spec.version = BlacklightLists::VERSION
  spec.authors = [ "Yetrina Battad" ]
  spec.email = [ "hello@yetti.io" ]

  spec.summary = "Allow Blacklight users to organise their bookmarks into lists"
  spec.homepage = "https://github.com/yetti/blacklight_lists"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/yetti/blacklight_lists/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = [ "lib" ]

  spec.add_dependency "blacklight", ">= 8", "< 9"
  spec.add_dependency "rails", ">= 7", "< 8"
  spec.add_dependency "view_component", "~> 3.9"

  spec.add_development_dependency "capybara"
  spec.add_development_dependency "engine_cart", "~> 2.6"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec-rails", "~> 7.0"
  spec.add_development_dependency "rubocop-capybara"
  spec.add_development_dependency "rubocop-factory_bot"
  spec.add_development_dependency "rubocop-rails-omakase"
  spec.add_development_dependency "selenium-webdriver", "~> 4.25"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-cobertura"
  spec.add_development_dependency "solr_wrapper"
  spec.add_development_dependency "sqlite3"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
