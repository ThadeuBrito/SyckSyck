require 'bundler/capistrano'
require 'delayed/recipes'

default_environment['GIT_SSL_NO_VERIFY'] = 'true'

set :application, "syck_syck"                 # Can be whatever you want, I use the project name from my SVN repository
set :user, "syck_syck"                         # Your HostingRails username
set :domain, "#{user}@midiaindoor.com.br"        # The URL for your app

# set :scm, :subversion
# set :repository, "https://svn.webservidor.net/trigger"  # The repository location for svn+ssh access
# set :scm_username, "eduardo"    #if http

set :scm, :git
set :repository, "https://corebit@bitbucket.org/corebit/syck_syck.git"  # Your clone URL
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, "master"
set :git_shallow_clone, 1
set :scm_verbose, true

set :use_sudo, false                  # HostingRails users don't have sudo access
set :deploy_to, "/home/#{user}/rails_apps/#{application}"          # Where on the server your app will be deployed
set :deploy_via, :export
set :chmod755, "app config db lib public script vendor script/*"   # Some files that will need proper permissions
set :normalize_asset_timestamps, false

default_run_options[:pty] = true
# Cap won't work on windows without the above line, see
# http://groups.google.com/group/capistrano/browse_thread/thread/13b029f75b61c09d
# Its OK to leave it true for Linux/Mac

role :app, domain
role :web, domain
role :db,  domain, :primary => true
