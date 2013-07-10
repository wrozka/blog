guard :rspec do
  watch(%r{^spec/(.+)\.rb$})         { "spec" }
  watch(%r{^lib/(.+)\.rb$})          { "spec" }

  watch('spec/spec_helper.rb')       { "spec" }
  watch(%r{^spec/support/(.+)\.rb$}) { "spec" }

  # Rails example
  watch(%r{^app/(.+)$})              { "spec" }
  watch('config/routes.rb')          { "spec" }
end

