ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.join(File.dirname(__FILE__), '.'))
require File.join(root, "config", "environment")

daemon = TweetStream::Daemon.new('tracker',
  log_output: false,
  backtrace: true,
  monitor: true,
  multiple: true,
  no_pidfiles: true
)
daemon.on_inited do
  ActiveRecord::Base.connection.reconnect!
end

daemon.on_error do |message|
  puts "on_error: #{message}"
end

daemon.on_reconnect do |timeout, retries|
  puts "on_reconnect: #{timeout}, #{retries}"
end

daemon.on_limit do |discarded_count|
  puts "on_limit: #{skip_count}"
end

daemon.track("@justinbieber") do |tweet|
  p tweet.text
  Tweet.create(text: tweet.text)
end