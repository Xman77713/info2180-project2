$(document).ready(function() {
	if ($.trim($("#login-div").html())) {
		console.log("login div is ready");
		$("#login-button").click(function() {
			let loginemail = $("#login-email").val();
			let loginpassword = $("#login-password").val();
			$.post("login.php",
			{
				login_email: loginemail,
				login_password: loginpassword
			},
			function(data,status) {
				console.log("Data: " + data + "\nStatus: " + status);
				if (data == "USERNAME_ERROR") {
					$("#login-error").html("Invalid Username")
				}
				else if (data == "PASSWORD_ERROR") {
					$("#login-error").html("Incorrect Password")
				}
				else {
					$("#login-div").empty();
					$("#db-div").append(data);
					menuInteract();
				}
			});
		});
	}
	function menuInteract() {
		$("aside li").click(function() {
			selection = $(this).text();
			$.post("navmenu.php",
			{
				menu_selection: selection
			},
			function(data, status) {
				console.log("Data: " + data + "\nStatus: " + status);
				$("#db-div section").remove();
				$("#db-div").append(data);
			}
			)
		});
	}
	/*function menustuff()
	if($("#db-div").html()) {
		console.log($("#db-div"));
		$("#db-div img").click(function(){
			$.post("newuser.php",
			{
				login_emails: "hi@email.com",
				login_passwords: "passwordy"
			},
			function(data,status){
				console.log("Data: " + data + "\nStatus: " + status);
				$("#db-div").append(data)
			});
		});
	}
	else {
		console.log("db div is not there");
	}*/
});