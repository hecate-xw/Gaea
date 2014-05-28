window.addEventListener("load",initAll,false);
function initAll() {
	var len = document.links.length;
	for( i = 0; i < len; i++ ) {
		document.links[i].onclick = showPic;
	}
}
function showPic( evt ) {
	var source = evt.target.getAttribute("href");
	var placeholder = document.getElementById("placeholder");
	placeholder.setAttribute( "src", source );
	source = evt.target.getAttribute("title");
	var textField = document.getElementById("description");
	textField.childNodes[0].nodeValue = source;
	return false;
}