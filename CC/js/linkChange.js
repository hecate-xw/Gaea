window.addEventListener("load",init,false);
function init() {
	moveOver();
}
function moveOver() {
	var links = document.getElementsByTagName("A");
	var len = links.length;
 	for( var i = 0; i < len; i++ ) {
		if(links[i].className == "item") {
			links[i].addEventListener("mouseover",function () {
				this.setAttribute("class","itemMove");
			},false);
			links[i].addEventListener("mouseout",function () {
				this.setAttribute("class","item");
			},false);
		}
	}
}