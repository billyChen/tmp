set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
set :scm, :git
set :repository, "https://github.com/billyChen/tmp.git"
set(:git_enable_submodules, true)

set :user, "billyChen"
server "91.121.184.127", :app
set :deploy_to, "/www/blog_staging"

ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache
set :copy_exclude, [".git", ".DS_Store", ".gitignore", ".gitmodules"]
set :use_sudo, false