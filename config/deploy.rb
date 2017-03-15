require 'openteam/capistrano/deploy'

append :linked_dirs, 'public/photos'

desc 'Download photos'
task :download_photos do
  on roles(:all) do |host|
    download! "#{shared_path}/public/photos",  'public', via: :scp, recursive: :true
  end
end

set :slackistrano,
  channel: (Settings['slack.channel'] rescue ''),
  webhook: (Settings['slack.webhook'] rescue '')
