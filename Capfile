load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks
load 'deploy/assets' # rake RAILS_ENV=production assets:precompile

namespace :deploy do
  task :start, :roles => :app do
    run "rm -rf /home/#{user}/public_html; ln -s #{current_path}/public /home/#{user}/public_html"
    run "cd #{shared_path}; mkdir files"
    run "ln -nfs #{shared_path}/files #{current_path}/public/files"
    run "cd #{current_path} && chmod 755 #{chmod755}"
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :restart, :roles => :app do
    run "ln -nfs #{shared_path}/files #{current_path}/public/files"
    run "cd #{current_path} && chmod 755 #{chmod755}"
    run "touch #{current_path}/tmp/restart.txt"
  end
end
