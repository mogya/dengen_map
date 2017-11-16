rails_root = File.expand_path('../../', __FILE__)

worker_processes Integer(ENV.fetch("WEB_CONCURRENCY") { 3 })
timeout 15
preload_app true

listen 8080
pid rails_root+'/tmp/unicorn.pid'
stderr_path File.expand_path(rails_root+'/log/unicorn_stderr.log', __FILE__)
stdout_path File.expand_path(rails_root+'/log/unicorn_stdout.log', __FILE__)

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
