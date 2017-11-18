namespace :unicorn do
  desc "Start unicorn"
  task :start => :common do
    config = Rails.root.join('config', 'unicorn.rb')
    sh "unicorn -c #{config} -E production -D"
  end

  desc "Stop unicorn"
  task :stop => :common do
    unicorn_signal :QUIT
  end

  desc "Restart unicorn with USR2"
  task :restart => :common do
    unicorn_signal :USR2
  end

  desc "Increment number of worker processes"
  task :increment => :common do
    unicorn_signal :TTIN
  end

  desc "Decrement number of worker processes"
  task :decrement => :common do
    unicorn_signal :TTOU
  end

  desc "Unicorn pstree (depends on pstree command)"
  task :pstree => :common do
    sh "pstree '#{unicorn_pid}'"
  end

  # Helpers
  def unicorn_signal signal
    Process.kill signal, unicorn_pid
  end

  def unicorn_pid
    begin
      File.read(Rails.root.join("tmp/unicorn.pid")).to_i
    rescue Errno::ENOENT
      raise "Unicorn does not seem to be running"
    end
  end
end
