require "twitter"
require_relative "./Console"

class TweetSong 
	def setup
		@config = Hash.new
		@config[:last_tweet_file_name] = '.thelasttweet' # File containing the last tweet id mentionned 
		@config[:lb_activation_duration] = 10000 # How long time the song will be played 
	end 

	@@instance = TweetSong.new
	def self.instance
		return @@instance
	end

	def run args
		command = args[0]

		# Start the UI if needed
		if Config.start_ui_if_needed command
			# Get the config
			setup

			# Run the infinite loop 
			begin
				puts 'Test if new tweets -- ' + Time.now.to_s + ' --'.bold
				if si
					puts '--> Send to LittleBits --'
					faire
				end 
				# pause for 60 seconds -- One call per minute is the maximum for twitter mentions API
				4.times do |i|
					remain = 60 - 15 * i
					puts "Next try in #{remain} seconds..." 
					sleep 15 
				end
			end while 1
		end
	end

	protected 

	# IF
	def si
		# Get the last read tweet id
		params = { count: 1 }
		if (File.readable?(@config[:last_tweet_file_name]))
			params[:since_id] = File.read(@config[:last_tweet_file_name])
		end
		
		# Call Twitter API 
		client = Twitter::REST::Client.new do |conf|
			conf.consumer_key        = Config.get('twt_consumer_key', true)
			conf.consumer_secret     = Config.get('twt_consumer_secret', true)
			conf.access_token        = Config.get('twt_access_token', true)
			conf.access_token_secret = Config.get('twt_access_token_secret', true)
		end
		tweets = client.mentions_timeline(params)

		# if new mentions 
		if tweets.count > 0
			# Save last id to file and trigger LittleBits
			File.open(@config[:last_tweet_file_name], 'w+') {|f| f.write(tweets[0].id) }
			return true
		else 
			return false
		end
	end 

	# DO
	def faire
		cmd = 'curl -i -XPOST -H "Authorization: Bearer ' + Config.get('lb_access_token', true) + '" -H "Accept: application/vnd.littlebits.v2+json" https://api-http.littlebitscloud.cc/devices/' + Config.get('lb_device_id', true) + '/output -d percent=100 -d duration_ms=10000'
		system cmd
	end
end 
