window.onload = function () {
	document.getElementById("form").addEventListener("submit", function(e){
		var password = document.getElementById("login-password").value
		var again = document.getElementById("again");
		const regex = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])/;

		//If password matches criteria submit form post otherwise show the try again tag
		if(!regex.test(password)){
			//not equal
			e.preventDefault();    //stop form from submitting
			again.classList.remove("again-hide");
			again.classList.add("again-show");

		}
	
	});
	
}