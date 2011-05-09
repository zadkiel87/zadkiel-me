require 'bundler/capistrano'

set :user, 'zad'
set :domain, 'ulla.bugz.fr'
set :application, 'zadkiel.me'

# the rest should be good
set :repository,  "git@github.com:zadkiel87/zadkiel-me.git" 
set :deploy_to, "/home/#{user}/public_html/www/#{application}"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false

default_run_options[:pty] = true
server domain, :app, :web

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end