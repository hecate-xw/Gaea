window.onload = initAll;
function initAll() {
	login();
	topLocation();
}
function topLocation() {
	if(top.location != self.location) {
		top.location.replace(self.location);
		//���ʹ��top.location = self.location;��ô�������back��ť�ͻ�ʧЧ
	}
}
function login() {
	if( document.getElementById ) {
		document.getElementById("login").onclick = pop_up;
		return false;
	} else {
		alert( "Your browser cannot support this script" );
	}
}
function pop_up( evt ) {
	if( evt ) {
		//alert("Love!!!");
	} else {
		//alert("Hate!!!");
	}
}