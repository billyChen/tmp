lock '3.3.5'

set :application, 'blog'
set :repo_url, 'git@github.com:BrandAndCelebrities/blog.git'
set :tmp_dir, "/home/nova/tmp"
set :scm, :git
set :log_level, :info
set :linked_files, %w(locales.xml)
set :linked_dirs, %w(uploads)
set :keep_releases, 5
set :deploy_via, "remote_cache"

def current_git_branch
  user = `git config --global user.name`.strip
  branch = ENV["REVISION"] || ENV["BRANCH_NAME"] ||`git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '') || "master"
  puts ""
  puts "".yellow
  puts ""
  puts "#{'ENV'.blue} - Environment selected is #{fetch(:stage).to_s == 'production' ? fetch(:stage).to_s.red : fetch(:stage).to_s.green}"
  puts "#{'USER'.blue} - Deploy power by #{user.green}"
  puts "#{'GIT'.blue} - Branch git use is #{branch.green}"
  puts "#{'DIR'.blue} - Deploy to #{fetch(:deploy_to).to_s.green}"
  puts "#{'Date'.blue} - #{Time.now.strftime('%d/%m/%Y %H:%M:%S').green}"
  puts ""
  puts "".yellow
  puts ""
  branch
end
