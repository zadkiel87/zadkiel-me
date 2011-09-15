require 'bundler/capistrano'

# To use rvm config
set :default_environment, { 
  'PATH' =>"/usr/local/rvm/bin:/usr/local/rvm/gems/ruby-1.9.2-p290/bin:/usr/local/rvm/gems/ruby-1.9.2-p290@global/bin:/usr/local/rvm/rubies/ruby-1.9.2-p290/bin:/usr/local/bin:/usr/kerberos/bin:/bin:/usr/bin:/home/zad/bin:$PATH",
  'RUBY_VERSION' => 'ruby 1.9.2p290',
  'GEM_HOME' => '/usr/local/rvm/gems/ruby-1.9.2-p290',
  'GEM_PATH' => '/usr/local/rvm/gems/ruby-1.9.2-p290:/usr/local/rvm/gems/ruby-1.9.2-p290@global' 
}

set :user, 'zad'
set :domain, 'ulla.bugz.fr'
set :application, 'zadkiel.me'

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