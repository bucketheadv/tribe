#!/usr/bin/env puma

application_path = File.expand_path("../..", __FILE__)
directory application_path
environment 'development'
# daemonize true if ENV['RAILS_ENV'] == 'production'
pidfile "#{application_path}/tmp/pids/puma_4000.pid"
state_path "#{application_path}/tmp/pids/puma_4000.state"
stdout_redirect "#{application_path}/log/puma_4000.stdout.log", "#{application_path}/log/puma_4000.stderr.log"

port 4000
workers 8
