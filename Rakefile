require "bundler/gem_tasks"

desc "Run tests"
task :rspec do
  cmd = "bundle exec rspec -f d"
  system(cmd) || raise("#{cmd} failed")
end

task :default => :rspec
