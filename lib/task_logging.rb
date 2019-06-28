# frozen_string_literal: true

module TaskLogging
  def task(*args, &block)
    Rake::Task.define_task(*args) do |task|
      if block_given?
        Rails.logger&.info "[#{task.name}] started"
        begin
          block.call(task)
          Rails.logger&.info "[#{task.name}] finished"
        rescue StandardError => e
          Rails.logger&.info "[#{task.name}] failed"
          raise e
        end
      end
    end
  end
end

# Override Rake::DSL#task to inject logging
extend TaskLogging
