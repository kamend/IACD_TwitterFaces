var fs = require("fs");
var Twit = require('twit');
var io = require('socket.io').listen(3000);

var T = new Twit({
        consumer_key: 'zxiwVTU1C5rEkXJHYA',
        consumer_secret: '9lZyskF21SnCpdkkKgmoXjcj2riMRgDXQU4rlp8gReQ',
        access_token: '317151030-JDVj124ROrYU56wddMch9nC3Yb9X3GZjH88AzfDM',
        access_token_secret: 'IcFKthSVDtyAKmsxhJKmzQXOCqo9DNVuEZxb2UuWko'
});

// Sentiment Part
var positiveWords = [];
var negativeWords = [];

function loadWords(filename, arraylist) {
        var data = fs.readFileSync(filename, 'utf8');
        var index = data.indexOf('\n');
        var last = 0;
        while(index > -1) {
                var line = data.substring(last,index);
                last = index+1;
                arraylist.push(line);
                index = data.indexOf('\n',last);
        }

}

function countNegative(text) {
        var count = 0;
        for(var i=0;i<negativeWords.length;i++) {
                if(text.indexOf(negativeWords[i]) > -1 && negativeWords[i].length > 2) {
                        count++;
                }
        }

        return count;
}

function countPositive(text) {
        var count = 0;
        for(var i=0;i<positiveWords.length;i++) {
                if(text.indexOf(positiveWords[i]) > -1 && positiveWords[i].length > 2) {
                        count++;
                }
        }

        return count;
}


function initSentiment() {
        loadWords('positive_words.txt', positiveWords);
        loadWords('negative_words.txt', negativeWords);
}

initSentiment();


// init cities

var cities = {
	'New York': {
		name: 'New York',
		query: '40.7142,-74.0064,100mi',
		geoId: '40.714',
		positive: 80,
		negative: 12,
		neutral: 8
		},
	'London': {
		name: 'London',
		query: '51.50722,-0.12750,100mi',
		geoId: '51.507',
		positive: 20,
		negative: 30,
		neutral: 50
		},
	'Cape Town': {
		name: 'Cape Town',
		query: '-33.9248685,18.4240552,100mi',
		geoId: '18.4240',
		positive: 10,
		negative: 80,
		neutral: 10
	},
	'Sydney': {
                name: 'Sydney',
                query: '-33.87365,151.206889,100mi',
                geoId: '151.20',
                positive: 10,
                negative:10,
                neutral: 80
    }};

	
var lastUpdateTime='';

function queryCities() {
	
	var dt = new Date();
	
	var dM = dt.getMinutes();
	if(dM<10) dM = "0" + dM;
	
	var dS = dt.getSeconds();
	if(dS<10) dS = "0" + dS;
	
	var dH = dt.getHours();
	if(dH<10) dH = "0" + dH;
	
	lastUpdateTime = dH+":"+dM+":"+dS
	
	console.log('Last Update:'+lastUpdateTime);
	var c = Object.keys(cities);
	c.forEach(function(city) {
		T.get('search/tweets', {geocode: cities[city].query, lang: 'en',count: 100}, function(err, reply) {
			//reply = {};
			
			if('statuses' in reply) {
		
				// to fix if reply is null
				var tweets = reply.statuses;
			
			
			
				console.log("Num Tweets: "+tweets.length);
				var rURL = reply.search_metadata.refresh_url;
			
			
				var foundCityName = "";
				var cityNames = Object.keys(cities);
				cityNames.forEach(function(cityName) {
					if(rURL.indexOf(cities[cityName].geoId) > -1) {
						foundCityName = cityName;
					}
				});
			
				if(foundCityName.length > 0) {
					var numPositive = 0;
					var numNegative = 0;
					var numNeutral = 0;
					for(var i=0;i<tweets.length;i++) {
						var tid = tweets[i].id;
						var user = tweets[i].user;
						var tweetText = tweets[i].text;
					
						var mood = countPositive(tweetText) - countNegative(tweetText);
					
						if(mood == 0) {
							numNeutral++;
						} else if(mood > 0) {
							numPositive++;
						} else if(mood < 0) {
							numNegative++;
						}
					}
				
					cities[foundCityName].positive = numPositive;
					cities[foundCityName].negative = numNegative;
					cities[foundCityName].neutral = numNeutral;	

				}
			
			}

		});
	});
}

io.sockets.on('connection',function(socket) {
	socket.on('get_list', function(data) {
		socket.emit('cities_list', cities);
	});

	socket.on("update_me", function(data) {
		socket.emit('update_list', cities);
		socket.emit('last_update_time', lastUpdateTime);
	});

	socket.on("force_twitter_update", function(data) {
		queryCities();
	});
});

 setInterval(function() {
 	queryCities(); }, 90000);

 queryCities();




