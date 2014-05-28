window.addEventListener("load",initAll,false);
function initAll() {
	checkForm();
}
function checkForm() {
	var userName = document.getElementById("userName");
	var forms = document.getElementsByTagName("form");
	userName.onfocus = function( e ) {
		userName.style.backgroundColor = "yellow";
	}
	userName.onblur = function( e1 ) {
		if( userName.value == "" ) {
			
		}
	}
	
	var pw = document.getElementById("pw");
	var pwd = document.getElementById("pwd");
	pw.addEventListener("blur",function( e2 ) {
		if( pw.value == "" ) {
			alert("!!!");
		}
	},false);
	pwd.addEventListener("blur",function( e3 ) {
		if( pwd.value == "" ) {
			alert("???");
		} else if( pw.value != pwd.value ) {
			alert("两次输入密码不同");
			pw.value = "";
			pwd.target.value = "";
		}	
	},false);
	
}