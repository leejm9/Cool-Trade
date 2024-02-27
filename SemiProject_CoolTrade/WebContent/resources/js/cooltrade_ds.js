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
