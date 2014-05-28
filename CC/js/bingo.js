//window.onload = initAll;
window.addEventListener("load",initAll,false);
var usedNums = new Array(76);
function initAll() {
	if( document.getElementById ) {
		document.getElementById("reload").onclick = anotherCard;
		newCard();
	} else {
		alert( "Your browser cannot support this script" );
	}
}
function anotherCard() { 
	for( var i = 0; i < usedNums.length; i++ ) {
		usedNums[i] = false;
	}
	newCard();
	return false;
}
function newCard() {
	for( var i = 0; i < 24; i++ ) {
		setSquare( i );
	}
}
function setSquare( thisSquare ) {
	var currSquare = "square" + thisSquare;
	var colPlace = new Array( 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4 );
	var colBasis = colPlace[thisSquare]*15;
	var newNum;
	do {
		newNum = colBasis + getNewNum() + 1;
	} while( usedNums[newNum] );
	usedNums[newNum] = true;
	document.getElementById(currSquare).innerHTML = newNum;
	document.getElementById(currSquare).className = "";
	document.getElementById(currSquare).onmousedown = toggleColor;
}
function getNewNum() {
	return Math.floor( Math.random() * 15 );
}
function toggleColor( evt ) {
	if(evt) {
		var thisSquare = evt.target;
	} else {
		var thisSquare = window.event.srcElement;
	}
	if( this.className === "" ) {
		this.className = "pickedBG";
	} else {
		this.className = "";
	}
	checkWin();
}

function checkWin() {
	var winningOption = -1;
	var setSquares = 0;
	var winners = new Array( 31, 992, 15360, 507904, 541729, 557328, 1083458, 2162802, 4329736, 8519745, 8659472, 16252928);
	
	for( var i = 0; i < 24; i++ ) {
		var currSquare = "square" + i;
		if( document.getElementById(currSquare).className != "" ) {
			document.getElementById( currSquare ).className = "pickedBG";
			setSquares = setSquares | Math.pow(2,i);
		}
	}
	for( var i = 0; i < winners.length; i++ ) {
		if( (winners[i] & setSquares) === winners[i] ) {
			winningOption = i;
		}
	}
	if( winningOption > -1 ) {
		for( var i = 0; i < 24; i++ ) {
			if( winners[winningOption] & Math.pow(2,i) ) {
				currSquare = "square" + i;
				document.getElementById(currSquare).className = "winningBG";
			}
		}
	}
}