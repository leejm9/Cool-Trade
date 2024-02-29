$(function(){
    $("#favoriteBtn-ds").click(function(){
        alert("Ctrl + D 를 눌러보세요!");
    })
})
$(document).ready(function(){
	$("#searchForm-ds").submit(function(e){
    	if($("#search-ds").val().trim() === ""){
    	e.preventDefault();
    	} 
	})
})

$(function(){
    $("#small_thumbnail-ds img").click(function(){
        let imgSrc = $(this).attr('src');
        $("#main_img-ds img").fadeOut(200, function() {
            $(this).attr('src', imgSrc);
            $(this).fadeIn(200);
        });
    });
});
$(document).ready(function(){
	let detailImgSrc = $("#small_thumbnail-ds").children().children().eq(0).attr("src")
	let mainImg = '<img src="' + detailImgSrc + '" alt="이미지가 없습니다.">';
	if(detailImgSrc != null){
		$("#main_img-ds").html(mainImg);
	}else{
		$("#main_img-ds").html('<img src="resources/images/noImage.png">')
	}
	
})