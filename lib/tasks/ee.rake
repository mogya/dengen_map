namespace :ee do
  desc "旧システムからデータをインポートします"
  task :import => :debug do
    query_limit = 500
    recent_api = Addressable::Template.new("https://oasis.mogya.com/api2/v0/recent_entries/{?query*}")
    # uri = recent_api.expand({query:{}})
    uri = recent_api.expand({
      query:{
        limit: query_limit
      }
    })
    loop do
      https = Net::HTTP.new(uri.host, 443)
      https.use_ssl = true
      res = https.start {
        https.get(uri.request_uri)
      }

      if res.code == '200'
        # json = ActiveSupport::JSON.decode res.body;nil
        # entry = json['results'].first
        json = ActiveSupport::JSON.decode res.body
        if json['status'] == 'OK'
          break if json['results'].size == 0
          json['results'].each do |entry|
            data = EeDatum.update_or_create_by_json(entry)
            logger.debug "#{data.spot_id}:#{data.title}(#{data.ee_update_at.strftime('%Y%m%d%H%M%S')})"
            uri = recent_api.expand({
              query:{
                before: data.ee_update_at.strftime('%Y%m%d%H%M%S'),
                limit: query_limit
              }
            })
          end
          logger.debug "EeData count:#{EeDatum.count}"
          logger.debug "next api url:#{uri.to_s}"
        else
          logger.error "#{json['status']}:#{json['message']}"
        end
      else
        logger.error "#{res.code}:#{res.message}"
        logger.debug res
      end
      sleep 1
    end

  end
end
