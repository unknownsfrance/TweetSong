# TweetSong

TweetSong is a fun script that use [LittleBits](http://littlebits.cc) to play a song each time your twitter account is mentionned. 

##### **Feel free to mention us on [Twitter](https://twitter.com/intent/tweet?text=@unknownsfrance%20), to start music in the open space!! :)**

![image](./assets/tweetsong.jpg =800x)


## Requirement 

#### 1. A LittleBits synchronized with the CloudBits. 

This script's setup will ask you for:

* a Device ID
* an Authentication Token

Everything can be configured and found on your [cloudbits](http://control.littlebitscloud.cc/)


#### 2. A twitter application 

You can easily create a Twitter application for your account, to be able to get the mentions.

[This 8-step tutorial](http://iag.me/socialmedia/how-to-create-a-twitter-app-in-8-easy-steps/) will help you creating it.


#### 3. Now you're ready to setup the script! 


## Setup 

#### 1. Clone the repository and move into the folder 

`git clone https://github.com/unknownsfrance/TweetSong.git`

`cd TweetSong`

#### 2. Run the script 

`ruby TweetSong.rb`

#### 3. Enter the config information 

**BE CAREFUL TO NEVER SHARE THE CONFIG FILE config.json**
** (especially if you want to put your version of this code online)**

The script will ask you to enter all the information it needs to work, that is to say the littlebits device information and twitter application information.


The terminal window should look like the following:

![image](./assets/console.png =800x)



## Manual configuration of the JSON file


If you don't want to use the setup or if you need to change some values, you can create/edit a **config.json** file in the TweetSong directory, with the following structure: 


	{
		"twt_consumer_key": "YOUR_TWITTER_CONSUMER_KEY",
		"twt_consumer_secret": "YOUR_TWITTER_CONSUMER_SECRET",
		"twt_access_token": "YOUR_TWITTER_ACCESS_TOKEN",
		"twt_access_token_secret": "YOUR_TWITTER_ACCESS_TOKEN_SECRET",
		"lb_device_id": "YOUR_LITTLE_BITS_DEVICE_ID",
		"lb_access_token": "YOUR_LITTLE_BITS_DEVICE_ACCESS_TOKEN"
	}
	

## Author

Unknowns, [www.unknowns.fr](http://www.unknowns.fr)


## License

TweetSong is available under the MIT license. See the [LICENSE](https://github.com/unknownsfrance/TweetSong/blob/master/LICENSE) file for more info.

Copyright (c) 2015, Unknowns