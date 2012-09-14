require 'bundler/capistrano'
#set :application, "testapp.charlesmaxwood.com"
set :application, "cms.rubynewauth.com"
set :repository,  "git@github.com:dayanthan/cms.git"


set :scm, :git


#set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "root"
##set :user, 'deploy'
set :use_sudo, false
##set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :deploy_to, "/var/www/cms"
set :repository_cache, "cached_copy"

role :web, "rubynewauth.com"                          # Your HTTP server, Apache/etc
role :app, "rubynewauth.com"                          # This may be the same as your `Web` server
role :db,  "rubynewauth.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:

after :deploy, "gems:install"
after "gems:install", "deploy:migrate"

# after "deploy" "deploy:bundle_gems"
# after "deploy:bundle_gems", "deploy:restart"

 # task :install do
 #    run "cd #{deploy_to}/current && RAILS_ENV=production rake gems:install"
 #  end

namespace :deploy do
task :bundle_gems do
	run "cd #{deploy_to}/current && bundle install vendor/gems"
end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# task :staging do
#   set :rails_env, 'staging'
#   role :app, "rubynewauth.com"
#   role :web, "rubynewauth.com"
#   role :db,  "rubynewauth.com", :primary => true
# end
