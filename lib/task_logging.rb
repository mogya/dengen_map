module TaskLogging
  def task(*args, &block)
    Rake::Task.define_task(*args) do |task|
      if block_given?
        Rails.logger.info "[#{task.name}] started" if Rails.logger
        begin
          block.call(task)
          Rails.logger.info "[#{task.name}] finished" if Rails.logger
        rescue => exception
          Rails.logger.info "[#{task.name}] failed" if Rails.logger
          raise exception
        end
      end
    end
  end
end

# Override Rake::DSL#task to inject logging
extend TaskLogging
