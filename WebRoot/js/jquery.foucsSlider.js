
$(function(){
	(function(){
		var curr = 0;
		$("#focusNav .trigger").each(function(i){
			$(this).click(function(){
				curr = i;
				$("#focusBox .focusImg").eq(i).fadeIn("slow").siblings(".focusImg").hide();
				$(this).siblings(".trigger").removeClass("imgSelected").end().addClass("imgSelected");
				return false;
			});
		});
		
		var pg = function(flag){
			if (flag) {
				if (curr == 0) {
					todo = 4;
				} else {
					todo = (curr - 1) % 2;
				}
			} else {
				todo = (curr + 1) % 2;
			}
			$("#focusNav .trigger").eq(todo).click();
		};
		
		//ǰ
		$("#prev").click(function(){
			pg(true);
			return false;
		});
		
		//
		$("#next").click(function(){
			pg(false);
			return false;
		});
		
		//Զ
		var timer = setInterval(function(){
			todo = (curr + 1) % 2;
			$("#focusNav .trigger").eq(todo).click();
		},5000);
		
		$("#focusBox,#prev,#next").hover(function(){
				clearInterval(timer);
			},
			function(){
				timer = setInterval(function(){
					todo = (curr + 1) % 2;
					$("#focusNav .trigger").eq(todo).click();
				},5000);			
			}
		);
	})();
});


