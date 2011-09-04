// User class to handle user data based on session

var User = {
	tariff: {
		t1: null,
		t2: null,
		t3: null	
	},
	
	storeData: function(){
		console.debug("Storing user data");
		$.post("/user/edit", this.tariff);
	},
	restoreData: function(){
		console.debug("Getting user data");
		user = this;
		$.getJSON("/user/get", function(data){
			user.tariff = data;
			user.restoreCallback();
		});
	},
}
