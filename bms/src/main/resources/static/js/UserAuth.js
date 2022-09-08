//Script tag changes to another file
$('document').ready(function(){			
		
	   var password = document.getElementById("pass")
		var cpassword = document.getElementById("cpass");
		function matchPassword(){
		  if(password.value != cpassword.value) {
			  cpassword.setCustomValidity("Password Don't Match");
		  } else {
			  //console.log('Entering ELSE');
			  cpassword.setCustomValidity('');
		  }
		}	
		password.onchange = matchPassword;
		cpassword.onkeyup = matchPassword;		
	});
	
	/*function showPassword() {
		var pass = document.getElementById("pass").lastChild;
		if(pass.type === "password")
			pass.type = "text";
		else
			pass.type = "password";
	}*/
   		
      const loginText = document.querySelector(".title-text .login");
      const loginForm = document.querySelector("form.login");
      const loginBtn = document.querySelector("label.login");
      const signupBtn = document.querySelector("label.signup");
      const signupLink = document.querySelector("form .signup-link a");
      signupBtn.onclick = (() => {
         loginForm.style.marginLeft = "-50%";
         loginText.style.marginLeft = "-50%";
      });
      loginBtn.onclick = (() => {
         loginForm.style.marginLeft = "0%";
         loginText.style.marginLeft = "0%";
      });
      signupLink.onclick = (() => {
         signupBtn.click();
         return false;
      });