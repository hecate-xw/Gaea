window.onload = initLinks;
var bannerArray = new Array("../image/banner1.jpg", "../image/banner2.jpg", "../image/banner3.jpg");
var len = parent.document.links.length;
function initLinks() {
	for( var i = 0; i < len; i++ ) {
		parent.document.links[i].onclick = setBanner;
	}
	setBanner();
}
function setBanner() {
	var randomNum = Math.floor( Math.random()*bannerArray.length );
	parent.document.getElementById("adBanner").src = bannerArray[randomNum];
	return false;
}