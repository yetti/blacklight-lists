require "simplecov"
require "simplecov-cobertura"

SimpleCov.configure do
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::CoberturaFormatter
    ]
  )
  add_filter do |source_file|
    source_file.lines.count < 10
  end
  add_filter "test"
  add_filter "config"
  add_filter "tmp"
  add_filter "lib"

  add_group "Services", "app/services"

  minimum_coverage line: 80
  maximum_coverage_drop 5
end

SimpleCov.start "rails" if ENV.fetch("CI", false) == "true"
