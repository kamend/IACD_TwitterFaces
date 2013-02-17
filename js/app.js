var appVars =  {
	cities: [],
	lastUpdateTime: "Never"
};

var socket;

function getListFromSocket() {
	setTimeout(function() {
		var p = Processing.getInstanceById('Processing_canvas');
		if(p) {
			console.log('P is Definded');
			socket.emit('get_list',{});
		} else {
			console.log('P is UNDEFINDED');
			getListFromSocket();
		}
	},2000);	
}

$(document).ready(function() {

	socket = io.connect(socketIoURL);
		
	socket.on('cities_list', function(data) {
		console.log(data);
		appVars.cities = data;
		
		var p = Processing.getInstanceById('Processing_canvas');
		
		if(p) {
			console.log("Adding cities");
			p.addCities();
		}
		
		socket.emit('update_me');
	});
	
	socket.on('update_list', function(data) {
		appVars.cities = data;
		var p = Processing.getInstanceById('Processing_canvas');
		if(p) {
			console.log("Updating cities");
			p.updateCities();
		}
	});

	socket.on('last_update_time', function(data) {
		if(data.length > 0) {
			appVars.lastUpdateTime = data;
		} else
			appVars.lastUpdateTime = 'Never';
	});

	$('#btnRefresh').click(function() {
		socket.emit('update_me');
	});
	
	$('#btnTwitter').click(function() {
		socket.emit('force_twitter_update');
	});
	


getListFromSocket();
	setInterval(function() {
		console.log('updateme, yo!');
	//	socket.emit('update_me');
	}, 30000);

});