# When sync mode is true, all output is immediately flushed to the underlying
# operating system and is not buffered internally.
$stdout.sync = true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
