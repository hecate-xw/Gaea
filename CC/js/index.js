$(function () {
	$(".audio").mb_miniPlayer( {
		width: 200,
		inLine: false,
		showRew: true,
		showTime: true
	});
	$("a.item").mouseover(function() {
		$(this).css({
			"text-decoration": "underline",
			"color": "red"
		});
	});
	$("a.item").mouseout(function() {
		$(this).css({
			"text-decoration": "none",
			"color": "#fffaf0"
		});
	});
});
$(function topLocation() {
	if(top.location != self.location) {
		top.location.replace(self.location);
		//如果使用top.location = self.location;那么浏览器的back按钮就会失效
	}
});