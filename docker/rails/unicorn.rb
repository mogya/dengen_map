rails_root = '/app'

worker_processes 1
working_directory rails_root

listen "#{rails_root}/tmp/unicorn.sock"
listen ENV['RAILS_PORT']
pid "#{rails_root}/tmp/unicorn.pid"

stderr_path "#{rails_root}/log/unicorn/#{ENV['RAILS_ENV']}_error.log"
stdout_path "#{rails_root}/log/unicorn/#{ENV['RAILS_ENV']}.log"
