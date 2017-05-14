require 'tel_splitter'

namespace :ee do
  task :stdout_log => :environment do
    batch_logger = ActiveSupport::Logger.new("log/batch.log")
    console_logger = ActiveSupport::Logger.new(STDOUT)
    batch_logger.formatter = ::Logger::Formatter.new
    batch_logger.level = Rails.logger.level
    batch_logger.extend ActiveSupport::Logger.broadcast(console_logger)
    Rails.logger = batch_logger

    require "task_logging"
  end

  desc "ExpressionEngineからエクスポートしたCSVファイルをロードします"
  task :import, ['filename'] => [:stdout_log, :environment] do |task, args|
    raise 'filename is mandatory parameter.' if args[:filename].nil?
    raise 'cannot read file.' unless File.readable?(args[:filename])

    CSV.foreach(args[:filename], encoding: "Shift_JIS:UTF-8", undef: :replace, replace: "*") do |row|
      spot = Spot.new
      spot.ee_id = row[0].gsub(/[^0-9]/,'').to_i
      next if (spot.ee_id == 0)
      spot.name = row[1]

      Tag::Category.tags(row[2]).each do |name,tag|
        if tag
          spot.tags<<tag
        else
          Rails.logger.warn("unknown tag:#{name}")
        end
      end

      spot.address = row[3]
      spot.lat = row[4].gsub(/[^0-9.]/,'').to_f
      spot.lng = row[5].gsub(/[^0-9.]/,'').to_f

      spot.links.build(url:row[6]) if row[6].present?

      Tag::Wifi.tags(row[8]).each do |name,tag|
        if tag
          spot.tags<<tag
        else
          Rails.logger.warn("unknown tag:#{name} (##{spot.ee_id})") unless name =~ /なし/
        end
      end

      Tag::Other.tags(row[9]).each do |name,tag|
        if tag
          spot.tags<<tag
        else
          Rails.logger.warn("unknown tag:#{name} (##{spot.ee_id})") unless name =~ /なし/
        end
      end

      spot.tel = TelSplitter.split(row[10].gsub(/[^0-9]/,'')).join('-')

      spot.spot_infos << SpotInfo.spot_infos(row[11])
      # Rails.logger.debug(spot)
      spot.save
    end
  end
end
