require "twitter"
require "json"
require_relative "./StringColors"

class Config
	@@filename = "config.json"

	private
	@@params = Hash.new 
	
	def self.start_ui_if_needed command
		# run setup or not regarding provided arguments 
		case command 
		when '--force-setup'
			force = true
		when 'run'
			force = false
		when nil
			force = false
		else 
			puts 'Unknown Command. To run the scriptm please use "tweetsong" or "tweetsong run"'.red
			return false
		end 

		self.start_ui force
		return true
	end
	
	def self.start_ui force = true
		# Ask the user his information 
		do_setup = true
		if force === false
			do_setup = ! self.is_conf_ok?
		end
		if do_setup === true
			self.welcome
			self.start_setup_ui
		end 
		
		# Read & Load file
		file = File.read('config.json')
		@@params = JSON.parse(file)
	end 

	def self.get key, raise_exception = false
		if @@params[key]
			return @@params[key]
		end
		# if parameter is necessary, we raise an exception. Otherwise, we return nil
		if raise_exception
			raise ArgumentError, "Parameter '#{key}' doesn't exist".red.bold
		else
			return nil
		end
	end 

	def self.set key, value
		#if @@params[key]
		#	return @@params[key]
		#end
		# if parameter is necessary, we raise an exception. Otherwise, we return nil
		if @@params[key] == nil
			raise ArgumentError, "Parameter '#{key}' doesn't exist".red.bold
		else
			return nil
		end
	end 
	
	protected 

	def self.is_conf_ok?
		if (File.readable?(@@filename))
			return true
		end 
		return false 
	end 

	def self.welcome
		puts "Welcome to the TweetSong installer".green.bold
		puts "You will need a Twitter account with an application, and a LittleBits device connected to a module in the CloudBits"
		puts "Check the documentation for more information"
	end 

	def self.start_setup_ui
		@conf = Hash.new

		# Twitter config 
		puts "Twitter Configuration".green.bold
		print "Consumer Key: "
		@conf[:twt_consumer_key] = $stdin.gets.chomp
		print "Consumer Secret: "
		@conf[:twt_consumer_secret] = $stdin.gets.chomp
		print "Application Access Token: "
		@conf[:twt_access_token] = $stdin.gets.chomp
		print "Application Access Token Secret: "
		@conf[:twt_access_token_secret] = $stdin.gets.chomp

		# LittleBits config
		puts "LittleBits Configuration".green.bold
		print "Device ID: "
		@conf[:lb_device_id] = $stdin.gets.chomp
		print "Access Token: "
		@conf[:lb_access_token] = $stdin.gets.chomp

		# Save conf 
		File.open(@@filename, 'w+') { |f| f.write(@conf.to_json) }
	end 
end 



