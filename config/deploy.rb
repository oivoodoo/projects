set :stages, %w(staging production)

require 'capistrano/ext/multistage'

set :scm, :git
set :repository,  "git@github.com:oivoodoo/projects.git"

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }
set :user, "hosting_onfly"

role :web, "lithium.locum.ru"                          # Your HTTP server, Apache/etc
role :app, "lithium.locum.ru"                          # This may be the same as your `Web` server

set :deploy_via, :remote_cache
set :use_sudo, false
set :spinner, false

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
  end
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

